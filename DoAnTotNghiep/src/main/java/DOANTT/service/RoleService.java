package DOANTT.service;


import org.springframework.stereotype.Service;
import DOANTT.model.Role;

import javax.transaction.Transactional;


@Service
public class RoleService extends BaseService<Role> {


    @Override
    public Class<Role> clazz() {
        // TODO Auto-generated method stub
        return Role.class;
    }

    @Transactional
    public Role getRoleByName(String name) {
        // Lấy Product trong DB
        Role role = super.getByName(name);
        return role;
    }
}
