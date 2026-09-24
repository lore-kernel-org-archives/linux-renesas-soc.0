Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6904B2EB0F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253046; cv=pass; b=a74Awx2L7qVhNiVMlMI5PRcgrRuD8Yc4Osr9OUdRTeTRnp7EGH1ufE/QFwYElhXHRjtb/xD/A4b0cPq6b62oX2mLE/Y3clTfEigdfw8s6w95WbAFFBdhE5OjjOt/C074Kebxzm+oJG1Rlw59WtsN+M+DerQB8dY00kD6z/haqNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253046; c=relaxed/simple;
	bh=+lsajvPrcwVHpdvopAQISLJ331bLt5xGidWZJHo/TxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lg6CYox+1kK11Ut2H1XgzUcmIyLrjYKdjlT1PoSnfcxZ3JMrVkJ073iFAd5MnPuwL+4vJNYA3lmW5e7Wo38B6strdRYb1VnM4k9s5QZ1j2vNlufgzZiFpJvAM5tf1FAuIl4gcvnSAndRPMliHsmN7zpZPfkbaQityCX8FfsSu20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=borLmFGT; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="borLmFGT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so1270266f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 05:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790253042; cv=none;
        d=google.com; s=arc-20260327;
        b=Ngf2e71PGcXuCtcJITVffstxFU1bmt+mz+8E7nLA9eLOy9rriCZ2NJNdIy3qTeulft
         tvws2cwPym99JbfmTm4jLJl3EVIoG4JiomsiX3jR89iVYsSXFCUUCb8Fzee72El2NQuN
         3XtjFKT1OWI6Ma9yT9aEyFsrTrDiLzufpTMoEjqj3T8nDIN2p5JNnNh0Dnu67+S3/lDo
         WFTnjcvAv60widIR1RtWDGbSk2IXgzQl0qZIsXPbjziTK6iJ2+LvAIJwXYnjGCdHVDD3
         /uhtpzAsZnn1Gndg7ZVsVU47dP31llLTFKWfqmNlvl8GiGtUXqOxJshavB+CRSdRGWn1
         NJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KchI2yh+e0/Y+qqc5spT0X4ywaHGKY+StJYN1UKsgj4=;
        fh=COPW+rM1TnRMEWxwKEmmpM2tFDR0MdEYosV/WKAH9wo=;
        b=SyP7vo6JtA71xDIx+x8pa8F9UkARGM49OD8ROKvokFK4LlCS9vGoBC5HYdFNqDC0sz
         oZC3r0nVmIWlcRjRhYM4ItsSK0j1EOUH4J/ISt6zORT52SqJRk3FWrnKeGkcW+ZU15wY
         9+ADUpSl18c7vVu4eChwxCL2UPckP1fmNY4IvrOwmnf7ASLpO9wYyoxSCHAMBK5MOtPZ
         S5MZapOexp9XV8GGX8ZWX37FobIfgnHAEndVTKmkFDMGZMUxEk97b25VbK4xDBq3PM6M
         RDdN+MvoFNORivJywsyaEpoG/FdmLA4fc/Qp79mD30HfdZNxTS90y4SUg245a3j7SQbq
         BWPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253042; x=1790857842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KchI2yh+e0/Y+qqc5spT0X4ywaHGKY+StJYN1UKsgj4=;
        b=borLmFGT4mdmp/aG1n7LDJ5+49VgNjD7hOZJRZkxhiofqun6HsfqWXNXoPeRGLht7m
         qvPjs59j1QZvRG1KAsThyA0OH1sSx+wTStqaL+zNgK/Bi+PPdSV+dxwMIcI8D8ogwRYZ
         Jlmhq86rGMo3uY/CBoqkZr+m0kFW3cJ8x5ot1aN1rRxD0xpowDeiyJETIlSgbRoAgl3s
         HzmXz7mo+RlvKYAqkTpMDT0xj3f+izkn8no7sJ5t/zX34CRTpz5vGnnhQ+sQpyYGIc7Z
         +WfH3jLSq+1o2pRkm95SJ0YPWAgF7RhyFAyCieyfvdwVtd9OOekbJ71wEyp9imIhqya8
         dOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253042; x=1790857842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KchI2yh+e0/Y+qqc5spT0X4ywaHGKY+StJYN1UKsgj4=;
        b=2xtLboByH+WRsNn0g7ss6jU1Sut+vkXMvUO4qufhw/Dd8CBqbukSHkXSNWaPAW04Xb
         rBpQrzDBMkoGfSbhc+z6qydST9xTm5nwZz4jh1IW5eBl5t0DLPYzd8STIt5/b2jlUCEc
         TcW5o00e0DOmsktS4cpw48vF55uAVtQho+dk/FTTSRGZk/mEog55aJPt3PYlDBpQugrN
         J+xHzL1WGxNqVvB5yDQNXhc64l//KTlk/HN5LhZorLjhqIjLHmvA9DhHPqAi4ziA/MJX
         uNEXtCDQMnJNx9A0pt5HqkWN+lTXYxMIjC1uee8n2LWaz6s8dzGrHFBZmA5/EgyzdZZz
         Bflg==
X-Forwarded-Encrypted: i=1; AKwUvByKlYRYlEH6KGyujGpPRrufwWVMv39ZPvjIHCJVPk32oFdSmoBCzxJSVR/caEJEIypHS5v5Y69ED73WnM3vaytPEQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lKJo9LWzpDUEmzJw4eagQ8ahe+9S5D3Yj5KopNFoX+Mzfnsw7V
	5O8M4PLBVUgZJl7RHOm2hRNfK9JppQroHlqOoIlcX6SXtVFKlVYO/Ahs98pGejs9wj6Dii9tXms
	xTSiQyOhVoxupUTRWnH1CJUUhzsFU/oI=
X-Gm-Gg: AYBFou25uTfAHDKgldLnk8wcKYuNxYd/a1UpfGKBsjFM5MJBIXPYA+YTqxuoGe6nJZd
	82zkUxNUvm7mMsm6OVnEPv2U0vZCxvZ8IJi37F1GHVE4uWPnB1AVecY4bEdzZMTkOrrXp8n/C/n
	plD+/iWcB8ElT20Xb2VFEOKw4ITcTh8scaTXJhzbNE2W41nJ7StbN1OxsZesfM7p85HTQGsrPVj
	lXe7uQP7KiAPn2SW5MhMrPgYfWlw/e1yMmn4keefjlaQJ51zVfvIlL1yUe0N7PdulPTlV6v7h7Q
	EbZE4Xk5+J7lZDdJ26jsj4I+KqLDpaQOH6YvXWtIRO2hu3d5Ag0ZtTU1DGas6ePAa3D0WJZq0MW
	hZx0pguy2Q6PGxD9CmxckgSA1HhGBze8f/kSS/8FlUIGxQtR96dECGZqaGSO3Sz/XySDjo7YW7w
	==
X-Received: by 2002:a05:6000:3106:b0:487:403:84f1 with SMTP id
 ffacd0b85a97d-4887166de8bmr4451754f8f.9.1790253042465; Thu, 24 Sep 2026
 05:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-9-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-9-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:30:15 +0100
X-Gm-Features: AclHuK8LT7REVPwwlcdlSrsYzoU8cyK6IUa0HajitJ8BO7GGQhxKGrn4EpV_TKQ
Message-ID: <CA+V-a8vh2bhmFV_kesEmsadg-5Q4v38ZD+iBXd0iMu06hhKzNQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] PCI: rzg3s-host: Add bridge::reset_root_port()
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:55=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add bridge::reset_root_port(). This allows, on some devices, performing
> reads and writes to an NVMe endpoint after a link down/link up cycle
> without failures.
>
> The implementation of struct pci_host_bridge::reset_root_port() masks all
> enabled interrupts and synchronizes them before resetting the controller
> to prevent asynchronous events from interfering with the reset operation.
>
> struct rzg3s_pcie_host::started boolean was added to keep track of the
> controller state, since rzg3s_pcie_host_start() and rzg3s_pcie_host_stop(=
)
> are called from multiple paths: .reset_root_port(), .suspend_noirq() and
> .resume_noirq(). The flag prevents double start/stop and breaking
> reference counters for clocks and resets.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - this patch is new and is a split from patch 7 of v3
> - use a boolean to keep track of the controller start state; with this
>   the state management code from patch 7 of v3 was dropped
>
>  drivers/pci/controller/pcie-rzg3s-host.c | 77 +++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 1c0353598b59..9cba898a9536 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -328,6 +328,7 @@ struct rzg3s_pcie_port {
>   * @intx_irqs: INTx interrupts
>   * @max_link_speed: maximum supported link speed
>   * @controller_id: PCIe controller identifier, used for System Controlle=
r access
> + * @started: The PCIe controller state (started or not)
>   * @num_lanes: The number of lanes
>   */
>  struct rzg3s_pcie_host {
> @@ -346,6 +347,7 @@ struct rzg3s_pcie_host {
>         int intx_irqs[PCI_NUM_INTX];
>         int max_link_speed;
>         enum rzg3s_pcie_controller_id controller_id;
> +       bool started;
>         u8 num_lanes;
>  };
>
> @@ -1110,6 +1112,11 @@ static void rzg3s_pcie_link_event(struct rzg3s_pci=
e_host *host)
>
>                 dev_info(host->dev, "PCIe link down, removing devices\n")=
;
>
> +               for_each_pci_bridge(dev, bridge->bus) {
> +                       if (pci_pcie_type(dev) =3D=3D PCI_EXP_TYPE_ROOT_P=
ORT)
> +                               pci_host_handle_link_down(dev);
> +               }
> +
>                 pci_lock_rescan_remove();
>                 list_for_each_entry_safe_reverse(dev, tmp, &bus->devices,
>                                                  bus_list)
> @@ -1855,6 +1862,9 @@ static int rzg3s_pcie_host_stop(struct rzg3s_pcie_h=
ost *host)
>         struct rzg3s_sysc *sysc =3D host->sysc;
>         int ret;
>
> +       if (!host->started)
> +               return 0;
> +
>         clk_disable_unprepare(port->refclk);
>
>         /* SoC-specific de-initialization */
> @@ -1876,6 +1886,8 @@ static int rzg3s_pcie_host_stop(struct rzg3s_pcie_h=
ost *host)
>         if (ret)
>                 goto power_resets_restore;
>
> +       host->started =3D false;
> +
>         return 0;
>
>         /* Restore the previous state if any error happens */
> @@ -1891,12 +1903,15 @@ static int rzg3s_pcie_host_stop(struct rzg3s_pcie=
_host *host)
>         return ret;
>  }
>
> -static int rzg3s_pcie_host_start(struct rzg3s_pcie_host *host)
> +static int rzg3s_pcie_host_start(struct rzg3s_pcie_host *host, bool set_=
started)
>  {
>         const struct rzg3s_pcie_soc_data *data =3D host->data;
>         struct rzg3s_sysc *sysc =3D host->sysc;
>         int ret;
>
> +       if (host->started)
> +               return 0;
> +
>         ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
>         if (ret)
>                 return ret;
> @@ -1929,6 +1944,9 @@ static int rzg3s_pcie_host_start(struct rzg3s_pcie_=
host *host)
>         if (ret)
>                 goto assert_power_resets;
>
> +       if (set_started)
> +               host->started =3D true;
> +
>         return 0;
>
>         /*
> @@ -1942,6 +1960,58 @@ static int rzg3s_pcie_host_start(struct rzg3s_pcie=
_host *host)
>         return ret;
>  }
>
> +static int rzg3s_pcie_host_reset_root_port(struct pci_host_bridge *bridg=
e,
> +                                          struct pci_dev *pdev)
> +{
> +       struct rzg3s_pcie_host *host =3D pci_host_bridge_priv(bridge);
> +       u32 irqs;
> +       int ret;
> +
> +       /* Mask link up/down interrupts. */
> +       writel(0, host->axi + RZG3S_PCI_PEIE0);
> +
> +       /* Mask INTx and MSI interrupts. */
> +       irqs =3D readl_relaxed(host->axi + RZG3S_PCI_PINTRCVIE);
> +       writel(0, host->axi + RZG3S_PCI_PINTRCVIE);
> +
> +       /*
> +        * Make sure the next operations are not disturbed by any pending
> +        * IRQs.
> +        */
> +       synchronize_irq(host->msi.irq);
> +       for (unsigned int i =3D 0; i < PCI_NUM_INTX; i++)
> +               synchronize_irq(host->intx_irqs[i]);
> +
> +       ret =3D rzg3s_pcie_host_stop(host);
> +       if (ret) {
> +               dev_err(host->dev, "Failed to stop the host!\n");
> +               goto unmask_irqs;
> +       }
> +
> +       ret =3D rzg3s_pcie_host_start(host, false);
> +       if (ret) {
> +               dev_err(host->dev, "Failed to start the host!\n");
> +
> +               /*
> +                * Don't unmask IRQs. We are in a bad state here and we
> +                * can recover only through a suspend/resume cycle. Just
> +                * return and preserve the stop state.
> +                */
> +               return ret;
> +       }
> +
> +unmask_irqs:
> +       /* Unmask INTx and MSI interrupts. */
> +       writel_relaxed(irqs, host->axi + RZG3S_PCI_PINTRCVIE);
> +
> +       /* Unmask link up/down interrupts. */
> +       writel(RZG3S_PCI_PEIE0_DL_UPDOWN, host->axi + RZG3S_PCI_PEIE0);
> +
> +       host->started =3D true;
> +
> +       return ret;
> +}
> +
>  static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
>  {
>         struct device_node *np =3D host->dev->of_node;
> @@ -2104,9 +2174,12 @@ static int rzg3s_pcie_probe(struct platform_device=
 *pdev)
>         if (ret)
>                 goto power_resets_assert;
>
> +       host->started =3D true;
> +
>         bridge->sysdata =3D host;
>         bridge->ops =3D &rzg3s_pcie_root_ops;
>         bridge->child_ops =3D &rzg3s_pcie_child_ops;
> +       bridge->reset_root_port =3D rzg3s_pcie_host_reset_root_port;
>         ret =3D pci_host_probe(bridge);
>         if (ret)
>                 goto host_probe_teardown;
> @@ -2156,7 +2229,7 @@ static int rzg3s_pcie_resume_noirq(struct device *d=
ev)
>         struct rzg3s_pcie_host *host =3D dev_get_drvdata(dev);
>         int ret;
>
> -       ret =3D rzg3s_pcie_host_start(host);
> +       ret =3D rzg3s_pcie_host_start(host, true);
>         if (ret)
>                 return ret;
>
> --
> 2.43.0
>
>
