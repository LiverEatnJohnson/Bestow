/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentDTO.java
 * Author     : Bullfrog
 * Date       : Feb 27 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package dto;

/**
 * @author Bullfrog
 */
public class DepartmentDTO {

    private int id;
    private String title;
    private int organizationId;
    private Long directorId;

    /**
     * Basic Constructor
     */
    public DepartmentDTO() {
    }

    public int getId() {
        return id;
    }

    /**
     * @param id Long
     */
    public void setId(int id) {
        this.id = id;
    }

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organization) {
        this.organizationId = organization;
    }

    public String getTitle() {
        return title;
    }

    /**
     * @param title String
     */
    public void setTitle(String title) {
        this.title = title;
    }

    public Long getDirectorId() {
        return directorId;
    }

    public void setDirectorId(Long directorId) {
        this.directorId = directorId;
    }

    public static class Builder {

        public Builder() {
            this.item = new DepartmentDTO();
        }
        private DepartmentDTO item;

        public Builder withId(final int id) {
            this.item.id = id;
            return this;
        }

        public Builder withTitle(final String title) {
            this.item.title = title;
            return this;
        }

        public Builder withOrganizationId(final int organizationId) {
            this.item.organizationId = organizationId;
            return this;
        }

        public Builder withDirectorId(final Long directorId) {
            this.item.directorId = directorId;
            return this;
        }

        public DepartmentDTO build() {
            return this.item;
        }
    }
}
