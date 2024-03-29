package br.com.sacfullnet.sacfullnet.controller;


import br.com.sacfullnet.sacfullnet.model.User;
import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import br.com.sacfullnet.sacfullnet.model.FAQ;
import br.com.sacfullnet.sacfullnet.service.FAQService;
import br.com.sacfullnet.sacfullnet.service.FAQEquipamentoService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

@RestController
@RequestMapping("/faq")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class FAQController {

    @Autowired
    FAQService faqService;

    @Autowired
    FAQEquipamentoService faqEquipamentoService;

    @GetMapping("")
    public ResponseEntity<List<FAQ>> findAllFAQs(@RequestParam(required = false) String search) {

        if(StringUtils.hasText(search)){
            List<FAQ> faqs = faqService.search(search);

            if (faqs == null) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok(faqs);
        }else{
            List<FAQ> faqs = faqService.find();

            if (faqs == null) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok(faqs);
        }
    }

    @PostMapping("")
    public ResponseEntity<Integer> save(@RequestBody FAQ faq) {

        System.out.println(faq.getEquipamentosRelacionados());
        int id = -1;

        id = faqService.save(faq);


        if (id == -1) {
            return ResponseEntity.notFound().build();
        }

        List<JsonNode> listEquipment = faq.getEquipamentosRelacionados();

        int isEquipamentoAdd = -1;
        for (JsonNode equipamento : listEquipment) {

            isEquipamentoAdd = faqEquipamentoService.addEquipamento(id, equipamento.get("id").asInt());
            if(isEquipamentoAdd == -1){
                return ResponseEntity.notFound().build();
            }
            isEquipamentoAdd = -1;
        }

        return ResponseEntity.ok(id);

    }

    @PutMapping("")
    public ResponseEntity<String> update(@RequestBody FAQ faq) {
        boolean ok = false;

        ok = faqService.update(faq);


        if (!ok) {
            return ResponseEntity.badRequest().build();

        }

        boolean isDeleted = faqEquipamentoService.deleteAll(faq.getId());

        if(!isDeleted){
            return ResponseEntity.badRequest().build();
        }


        List<JsonNode> listEquipment = faq.getEquipamentosRelacionados();

        int isEquipamentoAdd = -1;
        for (JsonNode equipamento : listEquipment) {

            isEquipamentoAdd = faqEquipamentoService.addEquipamento(faq.getId(), equipamento.get("id").asInt());
            if(isEquipamentoAdd == -1){
                return ResponseEntity.notFound().build();
            }
            isEquipamentoAdd = -1;
        }





        return ResponseEntity.ok("Atualizado com sucesso!");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Integer id) {
        boolean ok = false;

        ok = faqService.delete(id);

        if (ok) {
            return ResponseEntity.ok("Deletado com sucesso!");
        }

        return ResponseEntity.badRequest().build();
    }
}
