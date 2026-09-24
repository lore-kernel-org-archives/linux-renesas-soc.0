Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F946D547
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252617; cv=pass; b=mQlyeS5/f+oZHy8D/rYEPbc/OUHHM7h+10FufXFkkvWuWhIbRnYhBPafrntqVQaB6jKPCYDYQrYLGAX+/n/ASLiWzrL+N1tswyO3ev1A3mXlMpKXBOXpBDEKS8FCaZ5yRcy6cdjfcYOOAR1eTUt10duqOZZifRT20uPvHzwz7Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252617; c=relaxed/simple;
	bh=RNjjUPAqj04Zgmf3ERyYj6L+drgEgOadI/eoAl8Rxyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVphmkGXJD0794Soh9WPKnJNjgqmMVR3wZ0kaN9qKr1Cp5HIBcP/LAjw7Y3ZfuBLFXd51wha1RVttNHKnB4e9fT7oqi41tEbZK9ObpXHqCTNhmo6N9VplbkzjV4uOH0gn6UZvXCNmlx/6GpL8do2dWX+Pz6TI3vIpODCGypleYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUtIuKUp; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUtIuKUp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so1630827f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 05:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252614; cv=none;
        d=google.com; s=arc-20260327;
        b=Ex3ajYVonMoT/ZCRH3fWqvBOKJKQbB6p59ukS2lWNY6VbMjq5Ml/2olfdgmz9yOeF0
         ps/SOdfFTw3FQweLG/4h6oiFE/gkxSl+o5T8Ap0njEdu2jJ7DTtod2B6EQnFHqJmlHbj
         8mU1P+15P8ZIOK3rDUUEDt9XX0dRmoMgm6s2qm3X8P7SDhGFIbgQqwPj9s+7yBiYtq3c
         9qLTwE7M1UDVuLQxIDaKOzBMDXG4VsOGf9B1yMHZ4PzFnScljFjBkPvkA/ZsrVyxDViN
         aNvb1nqdZqyN77WGCFhIUD+QYg5K+3Fa4j/neG9H7k7A+IIfUK9UoKxASwqGg9xurpIy
         OJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rdRrzn5S9xJBL1cPeQCdlU0zlgaKl3QYL9gnErwMUoA=;
        fh=1R9QvmoY2KV5QjOoVW0YiHwbAzNcTCxdKiBd8m7it30=;
        b=HFp95Y0fG175VgiMl0qRnp9j0s59lByKwMPpN9RSG7s5Mzd5lzr+Zr8FPKMAStW9Lc
         WQmAJ23hTbgj22bI28q9EoZWPSEaNYhnU5gRXzCGNGa80MRGXqdQXOmi0fS4Ks4tnvBK
         7aM22eqddmn9TelZzmb8BP2O9OdSRQi74RhXRCBcRRQFrRHRqBb53L3uyZQ34qiVqBSz
         Jug3MZxqrd7OVkDe3VWi7t2CQw5SWLuqGOKVN3GUd6TLsUolr4CjMKxG/89o1CpkCwG8
         N3RJywkfBauV9ZcT3xfePnu/x6CievsAIu6qcUnIjijPTQzsALdycSp78psGLu0EhsE1
         DuMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790252614; x=1790857414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rdRrzn5S9xJBL1cPeQCdlU0zlgaKl3QYL9gnErwMUoA=;
        b=TUtIuKUp287WjjaJ/J5W1Doqa4hIngcO0ksxIaxRuZRwDbiWyRujH4zL8KlOWrED3C
         PJ9DW+ulAF/7H1TwMNpsJ+8LcvQF7R/ak0Zs5nIz7MqNdu/dTMJ/WA99Vq83XfmhYufL
         ktJe0Ll9WAQMi3GBDRKFzM9HxlMjPhYPfFTtIeIOWUxQ8W5l3D7pHmnsLDtngJcIqluA
         R97fD72gY5NRT/AFcd64rU/bVu8GQCKcxs7trNyBxlpgdwiZbStdwF6P0KRsbIXADimv
         tCiWJYgxFNGCZ+U+L+pXdFkKkMD2e3OoIfyUmzRwyZapeAnUb6tGU+a2eMNKlv4GTSD4
         4bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252614; x=1790857414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdRrzn5S9xJBL1cPeQCdlU0zlgaKl3QYL9gnErwMUoA=;
        b=qgc88+sjyx2rXVYhqTURo/c6tS8ChiK8oP4c3GxzBpThTmcI92QRFL/XYNtJRExhWr
         njqEab1sqk6ULaj9F54m7CO9b+bn5bERPwV+dCwf0kvX2hFrbIa/f8cqg5pgkiwSx1CV
         1CiPepAsgQ/hhFbMCBHFT3SzCUwRzYDx5RdJNY/n+FAd3GeC/q7i1ELElosTE9ERa7bb
         rpVQ4ubYEXwyB5NY+kEC5Tx2bRgOD2/KebiJLQLeJYSt9fuy/XMnE7nz33wSnD7FtHmO
         AfdpbKmd5p46v0rWM7SvYqP7C61tj8uanhhP8C1SBsGe2hONinU52LLWPMA0osIVAC2e
         /vrA==
X-Forwarded-Encrypted: i=1; AKwUvBzwTSPnBXOzzHkgxAjzfiH84NZDU+0ZhiYrYfI717XQGyeLMxNuYCn/Xff9K5UMYGEBBkuyKfkwS4wLM8Y0AeAPDQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m2L/HVSmI/OmfMcDFqWT/Z+vwV6FrBL4cWjdsxMN35atBCtZlv
	+LAQ1OorKqFKrIgVFVcm3CmqNemWHBZs8YSt5duS0kn8KnQR4+MsOwOjM07ki8vuAPozCpAyfcP
	7iwTd+L6YmAXfMQfPQ54BRmYyCx0BZKo=
X-Gm-Gg: AYBFou32GndXNthWP6qxXncqEPXsY56LnYYeK9rbRGMfvMztON8iVDikhHeBmhPCKYE
	Tj3jkDh2u886hohMds4l8rGiiC4kMv15rQpPqZ5q+WLUVlc/jHRSPiR9BCpcGzCPJa+VRFWx8bu
	retkbCQok1U/mWTPSufJx2ix1lR41H8PTVznQvf0kK/N8ngkQUBOF2hFaImn/rIjtcPsXX0e2T/
	M/2leo2QGSklZEFb+Oockx9G9+NbxUYIevtEh7BmTXkSwsrXWuJuejQ4RwahLzoBNWHPMR/2v82
	vQXYQp1pRjZMbdV3N6G8x5SvX1K/3Dq9IuB7YzO2lniMMcazQ+fjUgkc3EMerQJETaY+9N0fA73
	0wHWRwwdh8ghHaBd1ZGGoFI2FQvE45iVscHdH0ysaYSc=
X-Received: by 2002:a5d:5f8e:0:b0:486:e737:d94b with SMTP id
 ffacd0b85a97d-48871974c2fmr3738525f8f.51.1790252613801; Thu, 24 Sep 2026
 05:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-6-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-6-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:23:07 +0100
X-Gm-Features: AclHuK-A9mOEuZHDK0Q_tjNq3JBCpEEYs1c2VB24F6HG3wDPVZfQ5b43QBAhTjs
Message-ID: <CA+V-a8vr--5UVR+TLTWyEkzany3W-nwsteeVZEDv7D-sVqyK4g@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] PCI: rzg3s-host: Move suspend/resume code into
 dedicated functions
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:56=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> In preparation for implementing hotplug using
> pci_host_bridge::reset_root_port(), move the suspend/resume code into
> rzg3s_pcie_host_stop() and rzg3s_pcie_host_start(). These functions
> will later be reused by the hotplug implementation through
> pci_host_bridge::reset_root_port().
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
>  drivers/pci/controller/pcie-rzg3s-host.c | 181 ++++++++++++-----------
>  1 file changed, 96 insertions(+), 85 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 3ecada238402..40d5ef3e347e 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1742,6 +1742,100 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *hos=
t,
>         return ret;
>  }
>
> +static int rzg3s_pcie_host_stop(struct rzg3s_pcie_host *host)
> +{
> +       const struct rzg3s_pcie_soc_data *data =3D host->data;
> +       struct rzg3s_pcie_port *port =3D &host->port;
> +       struct rzg3s_sysc *sysc =3D host->sysc;
> +       int ret;
> +
> +       clk_disable_unprepare(port->refclk);
> +
> +       /* SoC-specific de-initialization */
> +       ret =3D data->config_deinit(host);
> +       if (ret)
> +               goto refclk_restore;
> +
> +       ret =3D reset_control_bulk_assert(data->num_power_resets,
> +                                       host->power_resets);
> +       if (ret)
> +               goto config_reinit;
> +
> +       /*
> +        * Since the power domain's genpd_suspend_noirq() will disable cl=
ocks,
> +        * there is no need to manually invoke runtime PM API here.
> +        */
> +
> +       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 0);
> +       if (ret)
> +               goto power_resets_restore;
> +
> +       return 0;
> +
> +       /* Restore the previous state if any error happens */
> +power_resets_restore:
> +       reset_control_bulk_deassert(data->num_power_resets,
> +                                   host->power_resets);
> +config_reinit:
> +       if (data->config_pre_init)
> +               data->config_pre_init(host);
> +       data->config_post_init(host);
> +refclk_restore:
> +       clk_prepare_enable(port->refclk);
> +       return ret;
> +}
> +
> +static int rzg3s_pcie_host_start(struct rzg3s_pcie_host *host)
> +{
> +       const struct rzg3s_pcie_soc_data *data =3D host->data;
> +       struct rzg3s_sysc *sysc =3D host->sysc;
> +       int ret;
> +
> +       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 1);
> +       if (ret)
> +               return ret;
> +
> +       if (host->num_lanes) {
> +               ret =3D rzg3s_sysc_config_func(host->sysc,
> +                                            RZG3S_SYSC_FUNC_ID_LINK_MAST=
ER,
> +                                            host->num_lanes =3D=3D 2  ?
> +                                            RZG3S_SYSC_LINK_MODE_DUAL_X2=
 :
> +                                            RZG3S_SYSC_LINK_MODE_SINGLE_=
X4);
> +               if (ret)
> +                       goto assert_rst_rsm_b;
> +       }
> +
> +       /*
> +        * Since the power domain's genpd_resume_noirq() will enable cloc=
ks,
> +        * there is no need to manually invoke runtime PM API here.
> +        */
> +
> +       ret =3D rzg3s_pcie_power_resets_deassert(host);
> +       if (ret)
> +               goto assert_rst_rsm_b;
> +
> +       ret =3D rzg3s_pcie_host_setup(host, rzg3s_pcie_msi_hw_setup,
> +                                   rzg3s_pcie_msi_hw_teardown);
> +       if (ret)
> +               goto assert_power_resets;
> +
> +       return 0;
> +
> +       /*
> +        * If any error happens there is no way to recover the IP. Put it=
 in the
> +        * lowest possible power state.
> +        */
> +assert_power_resets:
> +       reset_control_bulk_assert(data->num_power_resets, host->power_res=
ets);
> +assert_rst_rsm_b:
> +       rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
> +       return ret;
> +}
> +
>  static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
>  {
>         struct device_node *np =3D host->dev->of_node;
> @@ -1939,98 +2033,15 @@ static int rzg3s_pcie_probe(struct platform_devic=
e *pdev)
>  static int rzg3s_pcie_suspend_noirq(struct device *dev)
>  {
>         struct rzg3s_pcie_host *host =3D dev_get_drvdata(dev);
> -       const struct rzg3s_pcie_soc_data *data =3D host->data;
> -       struct rzg3s_pcie_port *port =3D &host->port;
> -       struct rzg3s_sysc *sysc =3D host->sysc;
> -       int ret;
> -
> -       clk_disable_unprepare(port->refclk);
> -
> -       /* SoC-specific de-initialization */
> -       ret =3D data->config_deinit(host);
> -       if (ret)
> -               goto refclk_restore;
> -
> -       ret =3D reset_control_bulk_assert(data->num_power_resets,
> -                                       host->power_resets);
> -       if (ret)
> -               goto config_reinit;
> -
> -       /*
> -        * Since the power domain's genpd_suspend_noirq() will disable cl=
ocks,
> -        * there is no need to manually invoke runtime PM API here.
> -        */
> -
> -       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 0);
> -       if (ret)
> -               goto power_resets_restore;
>
> -       return 0;
> -
> -       /* Restore the previous state if any error happens */
> -power_resets_restore:
> -       reset_control_bulk_deassert(data->num_power_resets,
> -                                   host->power_resets);
> -config_reinit:
> -       if (data->config_pre_init)
> -               data->config_pre_init(host);
> -       data->config_post_init(host);
> -refclk_restore:
> -       clk_prepare_enable(port->refclk);
> -       return ret;
> +       return rzg3s_pcie_host_stop(host);
>  }
>
>  static int rzg3s_pcie_resume_noirq(struct device *dev)
>  {
>         struct rzg3s_pcie_host *host =3D dev_get_drvdata(dev);
> -       const struct rzg3s_pcie_soc_data *data =3D host->data;
> -       struct rzg3s_sysc *sysc =3D host->sysc;
> -       int ret;
>
> -       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 1);
> -       if (ret)
> -               return ret;
> -
> -       if (host->num_lanes) {
> -               ret =3D rzg3s_sysc_config_func(host->sysc,
> -                                            RZG3S_SYSC_FUNC_ID_LINK_MAST=
ER,
> -                                            host->num_lanes =3D=3D 2  ?
> -                                            RZG3S_SYSC_LINK_MODE_DUAL_X2=
 :
> -                                            RZG3S_SYSC_LINK_MODE_SINGLE_=
X4);
> -               if (ret)
> -                       goto assert_rst_rsm_b;
> -       }
> -
> -       /*
> -        * Since the power domain's genpd_resume_noirq() will enable cloc=
ks,
> -        * there is no need to manually invoke runtime PM API here.
> -        */
> -
> -       ret =3D rzg3s_pcie_power_resets_deassert(host);
> -       if (ret)
> -               goto assert_rst_rsm_b;
> -
> -       ret =3D rzg3s_pcie_host_setup(host, rzg3s_pcie_msi_hw_setup,
> -                                   rzg3s_pcie_msi_hw_teardown);
> -       if (ret)
> -               goto assert_power_resets;
> -
> -       return 0;
> -
> -       /*
> -        * If any error happens there is no way to recover the IP. Put it=
 in the
> -        * lowest possible power state.
> -        */
> -assert_power_resets:
> -       reset_control_bulk_assert(data->num_power_resets,
> -                                 host->power_resets);
> -assert_rst_rsm_b:
> -       rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
> -       return ret;
> +       return rzg3s_pcie_host_start(host);
>  }
>
>  static const struct dev_pm_ops rzg3s_pcie_pm_ops =3D {
> --
> 2.43.0
>
>
