/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Aluno
 */
@Entity
@Table(name = "compralivro")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Compralivro.findAll", query = "SELECT c FROM Compralivro c"),
    @NamedQuery(name = "Compralivro.findById", query = "SELECT c FROM Compralivro c WHERE c.id = :id"),
    @NamedQuery(name = "Compralivro.findByQtda", query = "SELECT c FROM Compralivro c WHERE c.qtda = :qtda"),
    @NamedQuery(name = "Compralivro.findByValorunitario", query = "SELECT c FROM Compralivro c WHERE c.valorunitario = :valorunitario")})
public class Compralivro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "qtda")
    private int qtda;
    @Basic(optional = false)
    @Column(name = "valorunitario")
    private float valorunitario;
    @JoinColumn(name = "compra", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Compra compra;
    @JoinColumn(name = "livro", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Livro livro;

    public Compralivro() {
    }

    public Compralivro(Integer id) {
        this.id = id;
    }

    public Compralivro(Integer id, int qtda, float valorunitario) {
        this.id = id;
        this.qtda = qtda;
        this.valorunitario = valorunitario;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getQtda() {
        return qtda;
    }

    public void setQtda(int qtda) {
        this.qtda = qtda;
    }

    public float getValorunitario() {
        return valorunitario;
    }

    public void setValorunitario(float valorunitario) {
        this.valorunitario = valorunitario;
    }

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }

    public Livro getLivro() {
        return livro;
    }

    public void setLivro(Livro livro) {
        this.livro = livro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Compralivro)) {
            return false;
        }
        Compralivro other = (Compralivro) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Compralivro[ id=" + id + " ]";
    }
    
}
