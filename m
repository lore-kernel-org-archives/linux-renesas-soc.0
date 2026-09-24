Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478F35C1B2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252784; cv=pass; b=nwrpK0xlSco+kLWL7HIb93IP/u4j45e6eoqRpAyn8PhU6NjCO8NPnnl9Nr25nUMkVKzaXDLf0ayNeXWy1XiQNRk2U7QCw95vN78PTN30Ae5apy+o3ZPEbdFpxtKi0ziBWa0Iq9weLL2jJx3avlGC337aN5zRzIUrZkFvU9S6YkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252784; c=relaxed/simple;
	bh=9vSyr3e26Qz/fAvJZ42PLSKkIjr0FOmX+AK8aedKEO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGrcOieIg4zdcCDa3nBKa5kxjbm2Y/BJhv50XI/tkLyhsMIp4xKghxgVmZu5NXTSoitlBNt6LGLx85BA9PLj1He4D8+l6ZRkbPleKlCwcd0MQUeYk5UkyVzlSDetQgIcLG0Nnho6lc4z2aZx09fb2UlWIHrbRIV8l3WCeUxUHyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jq0LWYru; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jq0LWYru"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so1603290f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 05:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252781; cv=none;
        d=google.com; s=arc-20260327;
        b=Ppk0EKlr1XO1gouRLksTaevqIwCQCQpdKhGir6/QYEWDEjlPmWMj7Si0hh79TMtMvh
         I54hi9X6yIWmCxfOPaeDdWbkLtCrRCJECZd26x1vHFdnNuaAZ6Ksn0zwG29jiHeF3TX/
         PPdrMgv3zBJCQYbd/P2oQLlK2JPDwXi2GCo5KQjyMLGeXCRljQK56Yyg1fq/usm/vj1W
         Ju1ACc3inPKoGfKAG39iYaSkrakLPnpdBPsG9T6tFTycdG9eHCns5JK9vHKWXxLVFSrs
         sAZFWT2cEemHgrCydh/lqmTAsPKlrG9Qve1Lt1niIGXaJWjE8Yw37nCeUjjNJCq5SIEC
         853A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=44/rB8ZswRc008KoGmaclPt6xvztpmvmKKTq9AsEafQ=;
        fh=e76cmxXN5B1sH3Rb8Z2rOszk3M2Ozsfd0A4qXi/bGzY=;
        b=bW1ulf0OVrcrwNXnh7SOem7r+C2xTROvgSs98l9C3UoeXkYQpEi3zxPv4a7zlk7i/+
         i1gqdPQrqUTy0zsIHv0FDk/g6oV/1Bt7bxidXNui4SzoHsA2JNgWW8b9pt20Yb6LZiNK
         Xoeic04jmkzit4W5kU/fm2qm30N60I3RYGQJS0gsZ7taZaEvISURq27fM+yKtvSTVrY6
         DNVits24YGYE1rpoYVio4f1H2YYJDY0wo+96lhSHk6YmL7FK+WAkXpu5l4QTBbKCpl96
         SSbu1W/84x0e+Ib6HM1H+BGQY5Fhe7D3AQ7CFGxp1gk/jWhnPbGoS45bm9F/vKd6vu0+
         KchA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790252781; x=1790857581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44/rB8ZswRc008KoGmaclPt6xvztpmvmKKTq9AsEafQ=;
        b=jq0LWYrur3pxZgTwnaZPgTj6hdlIygHkwAAmz4wRVGVxadRYqMhDqvDKbg1fxuzHnU
         rV2FvybfnMZDhNySDh1KOIT1iqRC31HHpLeGcBdqRBAo6R1bX128VKkXJC4lHvu94vnF
         5DZ82qRc9dtzPA71B4oZ7lZ2Dlwjuvke94wvfbiisoEXClVFTC31i6ZMztPYh1uPAWAL
         U3o/8nJ2HT8x23qLmwSNHNM66+7qoTWisyQpyG6h6ppsCsz+e0hEnJ8H0hqJ2h5WlzHt
         1w1Qj9wpXkM5xCGF4vWFt2JkLePh7gkBFsMJQRhI9XgFiebH7uht4Wj4Ha+zIkuNVRrL
         KOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252781; x=1790857581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44/rB8ZswRc008KoGmaclPt6xvztpmvmKKTq9AsEafQ=;
        b=Cuph8N6ku8IDKVDnSh7KHnQzkgrWMpQnutXCED869tgCZod6Sglp7M4tDIHTS79LAn
         ayGdKK/eXy/hgRTnWtkW683Z9osMa4e4z7MsftLdm+2E+TjMz7RiLSSXXxjwO5bTLdEk
         w6/vo29zVbL8gwn/0TkYNvL/8aL1JSJe3mJUmD9E4BQkNf3GqX9BkrFtat2dpl8waOlE
         0Hs8FEeQlbA8jwfbyStR9aIkXruw2oBlhK80tUSjOL2Tn4hbKr7TV7LmKdTOoRvSE1W0
         +AeD2eWGlqyn8ULz2Ix0CMZGeraT10bMAEuhdxjzKeksUcXi7eBchyFsr6lsLBJcaXba
         L8wA==
X-Forwarded-Encrypted: i=1; AKwUvBzz6RR0oOwOauOY6T+a4IObjicn6GKvlEj/6dKLzLQ18XOM8lG2pbnqRaEvKpC02RGVDhpb8v5cnwsb9ubcMju5pg==@vger.kernel.org
X-Gm-Message-State: AFuF++lM5OqPqaA/949n3y1CdAN7Zb3LwyWnaAPcDXbJy3ypJYxpsBuX
	oxqav9iz+Jn6gl0qISqjsaDEbuX6RhLeUayFtMuw/1fh4/vQkSxVsg7EbskswglPvCPjIbER7pR
	3alR3a8ywTWP41PZCD/C4uncSZkDaNkw=
X-Gm-Gg: AYBFou28rTL0iC2PF1hA+H4aj2zeyvhlL01yfT3WWQ4kI0aq+INsSEaW0p44KZoXRvI
	TpcP6aKLQSQRIxguvzSCMItUtLcKONNJGHWSRjiFcrKq8AM1x0FdnEflYEyO1Vbpp7X3tVon4gb
	4HtfpeWDEPTRlXUhAuX21MBUWWqvxOTTLD7kK6WkBJcoo2mKZdTPfPG9GTDCVQ8bbloqd67i6ew
	Vagft/9OjEdMU9ElTkzlKJgmKnsCHvh9sreF5LL+JRDB9r/HmLnLe020EVqyR6q/Z6kQmATSDMC
	RMb+GRKZzGHahcmdYEcW7FrLi3+ffyjMf0Q6EGYGfgX90KuktiVNdL8ID+ghDXlKHqwATa4b6f2
	Yr5jjb5f4dQrePEtgADPal/nGEjFKWBC/ZLnZx50pFo/+MNb5eVclBeeCQWxcsAn0UCJPOep6BA
	==
X-Received: by 2002:a05:6000:705:b0:487:bef:31cb with SMTP id
 ffacd0b85a97d-488716ca7e9mr3905909f8f.22.1790252780878; Thu, 24 Sep 2026
 05:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-7-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-7-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:25:53 +0100
X-Gm-Features: AclHuK9gavbB6M7C_1T08SEgonhC2MdBJl0CvHQ9gIdkytsFMiv_mcHbK1pSAfU
Message-ID: <CA+V-a8t=7PGALbP3HMTYZyzB9Vp3w=Rx41yPCc_DHR-Z9+Afig@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] PCI: rzg3s-host: Move IRQ domain setup code
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
> Subsequent patches add support for the event IRQ to handle link
> up/down events. The event IRQ handler will use
> rzg3s_pcie_set_max_link_speed(). In preparation for adding event IRQ
> support, move the IRQ domain initialization code after
> rzg3s_pcie_set_max_link_speed().
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
>  drivers/pci/controller/pcie-rzg3s-host.c | 147 +++++++++++------------
>  1 file changed, 73 insertions(+), 74 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 40d5ef3e347e..f4b27a77a89d 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1006,80 +1006,6 @@ static const struct irq_domain_ops rzg3s_pcie_intx=
_domain_ops =3D {
>         .xlate =3D irq_domain_xlate_onetwocell,
>  };
>
> -static void rzg3s_pcie_teardown_intx(struct rzg3s_pcie_host *host,
> -                                    int count)
> -{
> -       while (--count >=3D 0) {
> -               irq_set_chained_handler_and_data(host->intx_irqs[count], =
NULL,
> -                                                NULL);
> -       }
> -
> -       if (host->intx_domain)
> -               irq_domain_remove(host->intx_domain);
> -}
> -
> -static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
> -{
> -       struct device *dev =3D host->dev;
> -       struct platform_device *pdev =3D to_platform_device(dev);
> -       int i, ret;
> -
> -       for (i =3D 0; i < PCI_NUM_INTX; i++) {
> -               char irq_name[5] =3D {0};
> -               int irq;
> -
> -               scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + =
i);
> -
> -               irq =3D platform_get_irq_byname(pdev, irq_name);
> -               if (irq < 0) {
> -                       ret =3D irq;
> -                       dev_err_probe(dev, ret,
> -                                     "Failed to parse and map INT%c IRQ\=
n",
> -                                     'A' + i);
> -                       goto teardown_intx;
> -               }
> -
> -               host->intx_irqs[i] =3D irq;
> -               irq_set_chained_handler_and_data(irq,
> -                                                rzg3s_pcie_intx_irq_hand=
ler,
> -                                                host);
> -       }
> -
> -       host->intx_domain =3D irq_domain_create_linear(dev_fwnode(dev),
> -                                                    PCI_NUM_INTX,
> -                                                    &rzg3s_pcie_intx_dom=
ain_ops,
> -                                                    host);
> -       if (!host->intx_domain) {
> -               ret =3D -EINVAL;
> -               dev_err_probe(dev, ret,
> -                             "Failed to add irq domain for INTx IRQs\n")=
;
> -               goto teardown_intx;
> -       }
> -       irq_domain_update_bus_token(host->intx_domain, DOMAIN_BUS_WIRED);
> -
> -       if (IS_ENABLED(CONFIG_PCI_MSI)) {
> -               ret =3D rzg3s_pcie_init_msi(host);
> -
> -               if (ret)
> -                       goto teardown_intx;
> -       }
> -
> -       return 0;
> -
> -teardown_intx:
> -       rzg3s_pcie_teardown_intx(host, i);
> -
> -       return ret;
> -}
> -
> -static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *host)
> -{
> -       if (IS_ENABLED(CONFIG_PCI_MSI))
> -               rzg3s_pcie_teardown_msi(host);
> -
> -       rzg3s_pcie_teardown_intx(host, PCI_NUM_INTX);
> -}
> -
>  static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
>  {
>         u32 remote_supported_link_speeds, max_supported_link_speeds;
> @@ -1169,6 +1095,79 @@ static int rzg3s_pcie_set_max_link_speed(struct rz=
g3s_pcie_host *host)
>         return ret;
>  }
>
> +static void rzg3s_pcie_teardown_intx(struct rzg3s_pcie_host *host, int c=
ount)
> +{
> +       if (host->intx_domain)
> +               irq_domain_remove(host->intx_domain);
> +
> +       while (--count >=3D 0) {
> +               irq_set_chained_handler_and_data(host->intx_irqs[count], =
NULL,
> +                                                NULL);
> +       }
> +}
> +
> +static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
> +{
> +       struct device *dev =3D host->dev;
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int i, ret;
> +
> +       for (i =3D 0; i < PCI_NUM_INTX; i++) {
> +               char irq_name[5] =3D {0};
> +               int irq;
> +
> +               scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + =
i);
> +
> +               irq =3D platform_get_irq_byname(pdev, irq_name);
> +               if (irq < 0) {
> +                       ret =3D irq;
> +                       dev_err_probe(dev, ret,
> +                                     "Failed to parse and map INT%c IRQ\=
n",
> +                                     'A' + i);
> +                       goto teardown_intx;
> +               }
> +
> +               host->intx_irqs[i] =3D irq;
> +               irq_set_chained_handler_and_data(irq,
> +                                                rzg3s_pcie_intx_irq_hand=
ler,
> +                                                host);
> +       }
> +
> +       host->intx_domain =3D irq_domain_create_linear(dev_fwnode(dev),
> +                                                    PCI_NUM_INTX,
> +                                                    &rzg3s_pcie_intx_dom=
ain_ops,
> +                                                    host);
> +       if (!host->intx_domain) {
> +               ret =3D -EINVAL;
> +               dev_err_probe(dev, ret,
> +                             "Failed to add irq domain for INTx IRQs\n")=
;
> +               goto teardown_intx;
> +       }
> +       irq_domain_update_bus_token(host->intx_domain, DOMAIN_BUS_WIRED);
> +
> +       if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +               ret =3D rzg3s_pcie_init_msi(host);
> +
> +               if (ret)
> +                       goto teardown_intx;
> +       }
> +
> +       return 0;
> +
> +teardown_intx:
> +       rzg3s_pcie_teardown_intx(host, i);
> +
> +       return ret;
> +}
> +
> +static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *host)
> +{
> +       if (IS_ENABLED(CONFIG_PCI_MSI))
> +               rzg3s_pcie_teardown_msi(host);
> +
> +       rzg3s_pcie_teardown_intx(host, PCI_NUM_INTX);
> +}
> +
>  static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>  {
>         struct pci_host_bridge *bridge =3D pci_host_bridge_from_priv(host=
);
> --
> 2.43.0
>
>
