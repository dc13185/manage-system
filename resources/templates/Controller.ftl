package ${package_name}.Action;
import ${package_name}.service.${table_name}Service;
import ${package_name}.model.request.${table_name}Request;
import ${package_name}.model.response.${table_name}Response;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 描述：${table_annotation}控制层
 * @author ${author}
 * @date ${date}
 */
@RestController
@RequestMapping(path = "${table_name}")
public class ${table_name}Controller {

    @Autowired
    private ${table_name}Service ${table_name?uncap_first}Service;

    /**
     * 描述：根据Id 查询
     * @param id  ${table_annotation}id
     */
    @GetMapping("findById")
    public ${table_name}Response findById(@RequestParam("id") ${id_type} id)throws Exception {
        ${table_name}Response ${table_name?uncap_first}Response = ${table_name?uncap_first}Service.query${table_name}ById(id);
        return ${table_name?uncap_first}Response;
    }

    /**
     * 描述:创建${table_annotation}
     * @param ${table_name?uncap_first}Request
     */
    @PostMapping("add")
    public void add(@RequestBody ${table_name}Request ${table_name?uncap_first}Request) throws Exception {
        ${table_name?uncap_first}Service.add${table_name}(${table_name?uncap_first}Request);
    }

    /**
     * 描述：删除${table_annotation}
     * @param id ${table_annotation}id
     */
    @DeleteMapping("deleteById")
    public void deleteById(@RequestParam("id") ${id_type} id) throws Exception {
        ${table_name?uncap_first}Service.delete${table_name}(id);
    }

    /**
     * 描述：更新${table_annotation}
     * @param ${table_name?uncap_first}Request ${table_name?uncap_first}Request
     */
    @PostMapping("update")
    public void update(@RequestBody ${table_name}Request ${table_name?uncap_first}Request) throws Exception {
        ${table_name?uncap_first}Service.update${table_name}(${table_name?uncap_first}Request);
    }

    /**
     * 描述：查询所有${table_annotation}
     */
    @PostMapping("queryAll")
    public List<${table_name}Response> queryAll() throws Exception {
        return  ${table_name?uncap_first}Service.queryAll();
    }

}