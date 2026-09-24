Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4297547D931
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252524; cv=pass; b=BQ6eEVf9+Zajt7Ya7YpK5ssVbl6EnEfix7kodo75iorJAEusM5VcIV5x/dhI6bpItxlshZUnnGnf5yUR6KRZVKS2fdqnTdv9dVjg16I9BblbqDybhHOF3VgophJScnZtxUcuL/IRGblXeC4o+VyhiRSK49pNDCsmrbwaajftIUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252524; c=relaxed/simple;
	bh=EvGodLlEbslRWzVQvua6EH6r9eVohRL7wEOeWlhU3Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Skh3bQF/C6qJSrXCwNHAmwPl4/ml4jMNg19FKpu+46iBYmp+bunlJ2oPstGNPrGOeQfovn7NFkeO4kMGeIQ02pp+loThpfa5hL1idl4Erb8RtWLD6+0sGMNZn7hWxIY78fSgWTkN5WNIUsg/71fdEPXhmBozlkPW+iSJYOhty2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePhEyO2t; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePhEyO2t"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso25155145e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 05:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252520; cv=none;
        d=google.com; s=arc-20260327;
        b=fpoZkkJtaKqjrvOS8LFF8AEcYSBlFYt+PCq/1gollebPSQsyPDyc5IIZI4/pYOyz2E
         4At49J4X7aDp7VHM04RjYV2aS66SGUTpntrIThr74IPIN//uu8aLF97Z56GoTNee2Lwp
         /jyLZOYEA4ip9nItps3Bz5hatHZ6qX69gr5smHCE/eHBdf58PkGzahJGkkexaVMFJv4b
         rAe0Vqvs9ZQcd8JJcDXvM3tongVpgu5K5uHMxGJY+tlXs0luEo3Gxs5Du4NYJ97yPngL
         1M4wPnWkPJOaXrtPfGM/b5DfZ5VB38QG69MFwSkVtN/FuWuVNAwPBZIMpTRO7LF4hpkg
         wiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bkDqHG9FQUeGbwC5soK6us7Sx1oxX72NgwVfnkQyDfQ=;
        fh=Ua3xSvIutlcr6tj9lGsuMLwtExDU3wWvwdj4HOtEPNw=;
        b=WakTKf7oiuqYLHVhYvYHVTvINZJIWi/8WJIr83kY8yaFqk8HUsDmBExCjxYpRR39DY
         6o514RUetk3huzGBBBULhUBDwxJC6blex2AMqmRmSNdscFTX+G5zvzHNdunwpEnPvLFI
         TN+pDfsesBmg8PffmGb+Xo89C0vpAOyNnhcIEtL5iQiWLnw8Pv/VqS6epk7dUYPbeb9P
         mZu8X6VHNGMn6N0tmpcbQb74lOpH129zlvfqrSQM/stQ91zg0fw7V6FrRZU18qB2kaGF
         L1R/thxEroxoV6I5sLRwoCTsErD6L26Rs5uhXFlaodSSaokIJrwYO6CdBtA/BwDy/9JY
         by+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790252520; x=1790857320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bkDqHG9FQUeGbwC5soK6us7Sx1oxX72NgwVfnkQyDfQ=;
        b=ePhEyO2tW/V68Azdc1SrOFp8Egk1JuGFNZrprJGBOjDuUNXPzVfsrijDB4CY6IXq4q
         BEIxFRZ1m/nKocoki5oPe4qRwWHCqwgkl+39McIsMfxU6aQdyPi9+VVJvSyFYfct8MZu
         v6UlhBteJLmY9LIlCHaWz3AvEzgsWnmMME5ZpwG1K2NDgDdwNL9ho75gZmsGSbUkGHPs
         xdktlGnnTWTUtRJtJviZo/Yy06ckRfVFYi+G05IWtUy0JKL84NsDvjEnVPrmQ2uAKv2g
         98HBVHPpRHbv/HtkybjnoU6jFNV7SuS3Oe/B0dRGFTiCemfEfGyc3QNgrbUscrbXNNo/
         hNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252520; x=1790857320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkDqHG9FQUeGbwC5soK6us7Sx1oxX72NgwVfnkQyDfQ=;
        b=Csd0gTaranB6T6sWsCV0rATepgGuu0UUliQ3lBcPADISe/ogVbXWh2lCiIjF7JJpDq
         5z1QSc70UC88AbAss/AF/D6aV3cxM4AHOq3ZsjWW6YlCWsu3xs3faaOENGqBYtCpXNbq
         vPoCDERlRj254yvL2bOkCj60TpXTfwhj1FJ3QhsQmZ426bdsLTUrlvn86smFczDrecSt
         98i/CweVtUYgV0vd7YuHu3RRTPPB7zypZbeCFb8A67OLEUIia0P0qtAsmiRN1T0JNC7K
         LkVjO410yEZeMEhX4DcCwFQvyg/h3KQLWH4TmeU/RyJkIzBIy1XPBqXh+YnlYeQls2fz
         s/Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwbDQ00QAfuOpSfeMh7scZqfc1KeJzcikp9PfwI8KfmsXPVDOuNvi3lKKjONVwVpCE41sqM5CVsTW0BfXmiw9z5cw==@vger.kernel.org
X-Gm-Message-State: AFuF++np5UF18gfH25Xlkpu22cGgSpKIJskfKDrB3BflunNrBXEQZYdQ
	aUKLSIrbAXgXl8t/nDGmqCLXsghxo9cgrD6QSKcmTQ1zPQfcPlmTdnsRLhs8r1Dq6qUUoDmi5oK
	yjwIuu9za0vOvqkJL6Q+b5gbiTyysb8M9z7PyEXM=
X-Gm-Gg: AYBFou3vbk3QFII0VgV7IDnlSbK5Q01IDnjiM2OpwADpImFbutC8N2ywv7nm+qujqOD
	zWImogWF10Q00IUNR6pKhMXrLHEwmHWyEPPEpHhxDDJ9kEjIBNTdaoziZMM6jooZw+eCCkD5LaK
	tgDZK9CyWbo9k/ktx/ZDE9JDSMSQqWuz2H+LU7yUCC4+RK0etqEXGMx60Zf7FgO1ogO45taX5Uw
	XfSoIDjiZvPUv1NT0mKjRiCGOisKo/xpLl3GmX4K1OTzJTPXuYNA7LAKz1nTHjSodmDgzV+vqOM
	0iRlgdlidckV4xMDTDISOExxqXTSjuctELJ9E/JLXkrb17UQsD2tUEuu6Axb0AYp7Hg0oZjDcZ7
	pup4U4J5buqzo6en4XMO6DAR0XeT4CO/HX4m03ms/bz8=
X-Received: by 2002:a05:600c:468c:b0:49f:bd3c:bc19 with SMTP id
 5b1f17b1804b1-49fe66f4cabmr36315625e9.20.1790252519986; Thu, 24 Sep 2026
 05:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-4-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-4-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:21:31 +0100
X-Gm-Features: AclHuK-O6h2RuWBPz-mV7C0IwMn3AQUXjZUOx9GCiSmdjH17BlohJmlvE2MoUV4
Message-ID: <CA+V-a8vicb6j9MAU=E_AxXr8JV3ERZGUz4TBWVCHD6nS4e-yzQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] PCI: rzg3s-host: Drop nop instructions
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
> On the RZ/G3S PCIe IP variant (which is similar to those used on the
> RZ/G3E, RZ/V2H, and RZ/V2N SoCs), access to the PCIe Type 1 registers
> requires setting the PCI_PERM.CFG_HWINIT_EN bit. Since this bit is not
> set on the code paths where rzg3s_pcie_set_max_link_speed() is called,
> the writes to PCI_EXP_LNKCTL2.TLS are nops. Drop them.
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
>  drivers/pci/controller/pcie-rzg3s-host.c | 5 -----
>  1 file changed, 5 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 0ef49bb5ab1a..362aa923978f 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1144,11 +1144,6 @@ static int rzg3s_pcie_set_max_link_speed(struct rz=
g3s_pcie_host *host)
>             remote_supported_link_speeds !=3D max_supported_link_speeds)
>                 return 0;
>
> -       /* Set target Link speed */
> -       rzg3s_pcie_update_bits(host->pcie, pcie_cap + PCI_EXP_LNKCTL2,
> -                              PCI_EXP_LNKCTL2_TLS,
> -                              FIELD_PREP(PCI_EXP_LNKCTL2_TLS, link_speed=
));
> -
>         /* Request link speed change */
>         rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_PCCTRL2,
>                                RZG3S_PCI_PCCTRL2_LS_CHG_REQ |
> --
> 2.43.0
>
>
