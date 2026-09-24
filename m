Received: from mail-wr2-f27.google.com (mail-wr2-f27.google.com [74.125.225.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B75380FD1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252564; cv=pass; b=HiXcRpMyWo4a3NKB+nXlEqhbiGQ7l5J7BkDO4wYQygVCYOz38iV5RafNkMiKqdnMoCBmk3LOsxPV9X3UGcJ4TknEFrE2rb8bxFmgQHln/A51FNRNtdUZeLub0eknC05rKvokvA5mWRnI+prBQjoDXmMHcADbo6m+rKfhg+waU4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252564; c=relaxed/simple;
	bh=Cw52wVNlkGTq00Bvj/+O0eoMgNOz8HZxwrEIpbKSa2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bh5VRglBXmuPJOxB6SVc7VtnGSOoGRfkVRApgjh8v/yzh8gmXW20fmFM142mZPxz0YNaNhizXJm7PxKA4HzsykvqEpl4GXNVJ1amkpoWL0MFaaRu3g8qJsXZYx1clPv6KXd4WHdSvyqqLpMgA9J4tBEa11b8goFFqgDqkKeHuBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pH9HTrWF; arc=pass smtp.client-ip=74.125.225.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pH9HTrWF"
Received: by mail-wr2-f27.google.com with SMTP id ffacd0b85a97d-4843796e373so1346958f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 05:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252560; cv=none;
        d=google.com; s=arc-20260327;
        b=hS06zAo0VOoGiVLkBxKvwligWnlgwx86ocw+hZo68TphJXmP8HXeiLnh1UhufB6uNe
         8I7R2wASBhe9g+A1byzjcMUUh9h7vqSqD4okNDk7tYk3dKoq2KsPRQIXwEvr71tPflml
         oyqaoDW71zwvLqfYlEKXeCgfcCTPWBbk0FZRktYY3EEwp4+2cZlBj/RMFCRy/bj/j3le
         XJjdUmGePEPLXLM0KrUCCHQrTMgyB+s0QUzv/DazBb+vBAnJ6Pxj+TOpE3QHsy8D+1Tb
         drlPxOBCHWWexVoiS6Y8o7RwJqqxaJQL+e+4vGhNwJic9lA12CoJ/Ij1KikfKIKLQ5J/
         kLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V7FuowMiVTc3wvrK4MWYuFA0l317MjW0sMi25vpCRZw=;
        fh=zGTAQV5r/gpGaWgkx9sOv9VKg18r3Z3W7nObJv9hqE0=;
        b=Hwm6JkVYLt3/lsnFgqnukd67Rb69KCl/Z4mtuVn2kDogJqej5nngbNthGO9rgHzAlf
         qp5gZYL5DBq2dpI1/5xHv6rNQRJzZDfFNTydz8Bs3eY6CBx+ZjmpdBdzJrm9LmsrWqtr
         SmHGoVUAS7MfEx4+v8VO0fe/wcV6YTXwDFmCZIvTp+UjYxlmVo1/TgyAaKlPI2jUdf9I
         oRnR73POyFfOmDUAUjsbC4uD48BBSs4isM5Z+86kkFqbEk49tVUgJn+YcaWe8SdDgL7N
         7NA2mAACu9df/49kLF2BVuEGxPDQFY/wY+yYNH2mxfPSKX3lInk7tkjVJcUXuIg5Qb6n
         rytQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790252560; x=1790857360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7FuowMiVTc3wvrK4MWYuFA0l317MjW0sMi25vpCRZw=;
        b=pH9HTrWFvaq65uQCf54vDK+emV9XafQdNRg4VME0ywIAwzYN4KkcN/3ExtPLS5ypCl
         HfQ5DXqQN/h6fwESIGDON1k2JFaho7YuA61hm8onHiQhUEoYSqNDPT4jCw7PFzlfRv20
         eS6e3E0bs4ceAfIwfXnLkQ8qtVm3sFE7JwHT4A7pH8GLkiIS3fROQMcwT0gccJ6mpeuz
         3tiTU020T3AeqjOrc2j/u4J4CKLE7D4B3s7uo3+pCwXZBhVf4lgsZXMZb6Vt3S7strDp
         utIWBdNDckzvgQ7IoUAUKgsJECPWAYzAVZjMF4fjjNpmaprwHErpqd+/KN6Tgjhy5nxe
         qUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252560; x=1790857360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7FuowMiVTc3wvrK4MWYuFA0l317MjW0sMi25vpCRZw=;
        b=uzN5HTaA35dJtFLikTxR/kMDXBFvO8XSmlTFngY8wwyhvZStnwJ8XMuWmLoJJVaxKq
         +Iw72CqhVHugV/v89c5Puokapxn8mRHzhSFMqUKhXW0890YOlmOTUiq0oIFt0gfSTvXN
         OQ+WIOL1PawETuewP099nziZASDRbb1gjN3jwbX/c0L76XyisJwd1Tp0/G49OA6H3cBh
         C4Bkkael3EnnegBJfQIcBCjyOEwwaWjuO3Qx2hCKttuvsnrnh8sF3q7eEZfh74TKrIBH
         7TxlPOkr0CEj2QErbf7mJ4dRHDxGo+Y/Z8AjCxwiEIuq3Mv3qtA7twYEswYXdjIPjiB+
         Sgwg==
X-Forwarded-Encrypted: i=1; AKwUvBwK1l18sa27L/RxRHxWewQFmHx6IA4TbhKpl79W+x2YBN0lv9MJd+vXd+Kw+7Zgn8HewJJCqN9JHJNpdlwuGvrtZA==@vger.kernel.org
X-Gm-Message-State: AFuF++kogYqNo2C+WOj/k+B8CfsL3KxPAxkKeED66TS5yTWohCNCVIAQ
	puF9q/KedTO+JyJBmUPAXQOjVi/ahZ1pWYwDts5wl7h/7DnNdsrVBnCsH/x/hBF2JhzRSF927jt
	pwAnKXuBx1OKrNKKuYr4S/rahNY7P9Rk=
X-Gm-Gg: AYBFou2ZpD6qk1amqIDJ7PBja1zsdYSmTeSOzbdi3R22GZT/W25KtO3zWZXAZu6cm7a
	UdcEucIYwYLD0kkV64qyQB9sDv2IQHKyV/c14pM17UmviQBmvlWTnVmaeQWfus3FlthPu5UAOFv
	njcGwrWMDDrunB/nohnrFtEVPF7nWy+vs4/aEBEUgHyEE7wIF9xK0QzToSBmkZ59RRwbEshTXcr
	Zuu1h+56DyyAqQkV9hulEduFy2nzQHy5kCO/H1zI43nOdnMbV0cL2AlAl72Ez/0uXPW+VFMLODi
	ylq+veJijSbnXJBlf/3VWihmSUFtMBSQADWw3AoBFMrC3RUacHFW5MWQ/2q2O8Vs26MaqkUBO0D
	trpM1kX8C7ol9r8xzjzydhmouFwYQLNe/VNgSJcVMOqs=
X-Received: by 2002:a05:6000:2f81:b0:487:24cc:8bb3 with SMTP id
 ffacd0b85a97d-488716f4191mr3751864f8f.29.1790252559866; Thu, 24 Sep 2026
 05:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-5-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-5-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:22:13 +0100
X-Gm-Features: AclHuK80ZnuVKuOmssganhJ27DYMScJQRQGFgo2UOVE_0RqUnU9MRUwMu6QlG68
Message-ID: <CA+V-a8tczmMXBoh_bp5i9cQ+YWatqsA9oM6eg_PBEC0bA+sbTA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] PCI: rzg3s-host: Move host configuration code together
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:54=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Move host configuration code together to have it grouped. This prepares f=
or
> the addition of hotplug support.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - none
>
> Changes in v3:
> - none, this patch is new
>
>  drivers/pci/controller/pcie-rzg3s-host.c | 230 +++++++++++------------
>  1 file changed, 115 insertions(+), 115 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 362aa923978f..3ecada238402 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1356,121 +1356,6 @@ static int rzg3s_pcie_resets_prepare_and_get(stru=
ct rzg3s_pcie_host *host)
>                                                               host->cfg_r=
esets);
>  }
>
> -static int rzg3s_pcie_host_parse_port(struct rzg3s_pcie_host *host)
> -{
> -       struct device_node *of_port __free(device_node) =3D
> -               of_get_next_child(host->dev->of_node, NULL);
> -       struct rzg3s_pcie_port *port =3D &host->port;
> -       int ret;
> -
> -       ret =3D of_property_read_u32(of_port, "vendor-id", &port->vendor_=
id);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D of_property_read_u32(of_port, "device-id", &port->device_=
id);
> -       if (ret)
> -               return ret;
> -
> -       port->refclk =3D of_clk_get_by_name(of_port, "ref");
> -       if (IS_ERR(port->refclk))
> -               return PTR_ERR(port->refclk);
> -
> -       return 0;
> -}
> -
> -static int rzg3s_pcie_host_init_port(struct rzg3s_pcie_host *host)
> -{
> -       struct rzg3s_pcie_port *port =3D &host->port;
> -       struct device *dev =3D host->dev;
> -       int ret;
> -
> -       /* Enable access control to the CFGU */
> -       writel_relaxed(RZG3S_PCI_PERM_CFG_HWINIT_EN,
> -                      host->axi + RZG3S_PCI_PERM);
> -
> -       /* Update vendor ID and device ID */
> -       writew_relaxed(port->vendor_id, host->pcie + PCI_VENDOR_ID);
> -       writew_relaxed(port->device_id, host->pcie + PCI_DEVICE_ID);
> -
> -       /* Disable access control to the CFGU */
> -       writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> -
> -       ret =3D clk_prepare_enable(port->refclk);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "Failed to enable refclk!\=
n");
> -
> -       /* Set the PHY, if any */
> -       if (host->data->init_phy) {
> -               ret =3D host->data->init_phy(host);
> -               if (ret) {
> -                       dev_err_probe(dev, ret, "Failed to set the PHY!\n=
");
> -                       goto refclk_disable;
> -               }
> -       }
> -
> -       return 0;
> -
> -refclk_disable:
> -       clk_disable_unprepare(port->refclk);
> -       return ret;
> -}
> -
> -static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
> -{
> -       u32 val;
> -       int ret;
> -
> -       /* SoC-specific pre-configuration */
> -       if (host->data->config_pre_init)
> -               host->data->config_pre_init(host);
> -
> -       /* Initialize the PCIe related registers */
> -       ret =3D rzg3s_pcie_config_init(host);
> -       if (ret)
> -               goto config_deinit;
> -
> -       ret =3D rzg3s_pcie_host_init_port(host);
> -       if (ret)
> -               goto config_deinit;
> -
> -       /* Enable ASPM L1 transition for SoCs that use it */
> -       ret =3D rzg3s_sysc_config_func(host->sysc,
> -                                    RZG3S_SYSC_FUNC_ID_L1_ALLOW, 1);
> -       if (ret)
> -               goto config_deinit_and_refclk;
> -
> -       /* Initialize the interrupts */
> -       rzg3s_pcie_irq_init(host);
> -
> -       /* SoC-specific post-configuration */
> -       ret =3D host->data->config_post_init(host);
> -       if (ret)
> -               goto config_deinit_and_refclk;
> -
> -       /* Wait for link up */
> -       ret =3D readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
> -                                !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS),
> -                                PCIE_LINK_WAIT_SLEEP_MS * MILLI,
> -                                PCIE_LINK_WAIT_SLEEP_MS * MILLI *
> -                                PCIE_LINK_WAIT_MAX_RETRIES);
> -       if (ret)
> -               goto config_deinit_post;
> -
> -       val =3D readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
> -       dev_info(host->dev, "PCIe link status [0x%x]\n", val);
> -
> -       return 0;
> -
> -config_deinit_post:
> -       host->data->config_deinit(host);
> -config_deinit_and_refclk:
> -       clk_disable_unprepare(host->port.refclk);
> -config_deinit:
> -       if (host->data->config_pre_init)
> -               host->data->config_deinit(host);
> -       return ret;
> -}
> -
>  static void rzg3s_pcie_set_inbound_window(struct rzg3s_pcie_host *host,
>                                           u64 cpu_addr, u64 pci_addr, u64=
 size,
>                                           int id)
> @@ -1698,6 +1583,121 @@ static int rzg3s_soc_pcie_init_phy(struct rzg3s_p=
cie_host *host)
>         return 0;
>  }
>
> +static int rzg3s_pcie_host_parse_port(struct rzg3s_pcie_host *host)
> +{
> +       struct device_node *of_port __free(device_node) =3D
> +               of_get_next_child(host->dev->of_node, NULL);
> +       struct rzg3s_pcie_port *port =3D &host->port;
> +       int ret;
> +
> +       ret =3D of_property_read_u32(of_port, "vendor-id", &port->vendor_=
id);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D of_property_read_u32(of_port, "device-id", &port->device_=
id);
> +       if (ret)
> +               return ret;
> +
> +       port->refclk =3D of_clk_get_by_name(of_port, "ref");
> +       if (IS_ERR(port->refclk))
> +               return PTR_ERR(port->refclk);
> +
> +       return 0;
> +}
> +
> +static int rzg3s_pcie_host_init_port(struct rzg3s_pcie_host *host)
> +{
> +       struct rzg3s_pcie_port *port =3D &host->port;
> +       struct device *dev =3D host->dev;
> +       int ret;
> +
> +       /* Enable access control to the CFGU */
> +       writel_relaxed(RZG3S_PCI_PERM_CFG_HWINIT_EN,
> +                      host->axi + RZG3S_PCI_PERM);
> +
> +       /* Update vendor ID and device ID */
> +       writew_relaxed(port->vendor_id, host->pcie + PCI_VENDOR_ID);
> +       writew_relaxed(port->device_id, host->pcie + PCI_DEVICE_ID);
> +
> +       /* Disable access control to the CFGU */
> +       writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> +
> +       ret =3D clk_prepare_enable(port->refclk);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to enable refclk!\=
n");
> +
> +       /* Set the PHY, if any */
> +       if (host->data->init_phy) {
> +               ret =3D host->data->init_phy(host);
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "Failed to set the PHY!\n=
");
> +                       goto refclk_disable;
> +               }
> +       }
> +
> +       return 0;
> +
> +refclk_disable:
> +       clk_disable_unprepare(port->refclk);
> +       return ret;
> +}
> +
> +static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
> +{
> +       u32 val;
> +       int ret;
> +
> +       /* SoC-specific pre-configuration */
> +       if (host->data->config_pre_init)
> +               host->data->config_pre_init(host);
> +
> +       /* Initialize the PCIe related registers */
> +       ret =3D rzg3s_pcie_config_init(host);
> +       if (ret)
> +               goto config_deinit;
> +
> +       ret =3D rzg3s_pcie_host_init_port(host);
> +       if (ret)
> +               goto config_deinit;
> +
> +       /* Enable ASPM L1 transition for SoCs that use it */
> +       ret =3D rzg3s_sysc_config_func(host->sysc,
> +                                    RZG3S_SYSC_FUNC_ID_L1_ALLOW, 1);
> +       if (ret)
> +               goto config_deinit_and_refclk;
> +
> +       /* Initialize the interrupts */
> +       rzg3s_pcie_irq_init(host);
> +
> +       /* SoC-specific post-configuration */
> +       ret =3D host->data->config_post_init(host);
> +       if (ret)
> +               goto config_deinit_and_refclk;
> +
> +       /* Wait for link up */
> +       ret =3D readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
> +                                !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS),
> +                                PCIE_LINK_WAIT_SLEEP_MS * MILLI,
> +                                PCIE_LINK_WAIT_SLEEP_MS * MILLI *
> +                                PCIE_LINK_WAIT_MAX_RETRIES);
> +       if (ret)
> +               goto config_deinit_post;
> +
> +       val =3D readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
> +       dev_info(host->dev, "PCIe link status [0x%x]\n", val);
> +
> +       return 0;
> +
> +config_deinit_post:
> +       host->data->config_deinit(host);
> +config_deinit_and_refclk:
> +       clk_disable_unprepare(host->port.refclk);
> +config_deinit:
> +       if (host->data->config_pre_init)
> +               host->data->config_deinit(host);
> +       return ret;
> +}
> +
>  static int
>  rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
>                       int (*init_irqdomain)(struct rzg3s_pcie_host *host)=
,
> --
> 2.43.0
>
>
