Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1551944A708
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842077; cv=pass; b=aMaXh46RHiKicc1KNJGIRgZHTS9Tf631gKpQdwUU9aguwxVO0eT4uh0XvJYANJ7bIzo/TSwMwW9ydltMRzgCAVCJ8LDNbG+4Ukr+VPW9V04YQLfS0TR7/g/R1wAYxCUC9iPPX8ZLcpLIbcdO8D5o/Cufe8XdKYLbDD7addeT+Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842077; c=relaxed/simple;
	bh=mhPnoofehpAnih/7vt9wRjfa6Jbx3NTWojOWvQWkOmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNJht7Xx5PMR8zGVczmAPcwoTPdsHFhbzToudgaJxYn4XRZiyRBX9eIB3q8TFPQcq4BhAJV1/SfEV2rYh2a2sCc0smb95pxL9a+UmUcL/O9eDYghaGUtqlsempmVpON9GJDPMAvUti69rn9xV7wzn2pkQ5Nb0FANw2kWSeHThOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3hwn5FG; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3hwn5FG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a006d3fe83so17712965e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 01:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790842073; cv=none;
        d=google.com; s=arc-20260327;
        b=X9pHPYmMerboMX8rf9dmLOzg/xgej3iOdscE2MIGjNDS4PwredAjaJtWcrW7F7JeQQ
         pP+DJWgo4/NLoWbyq/Bp29X6SmjR4K8xAgWEWhvMSsqTy/PiPHKBf3AyKS8RBG/JmaOy
         mFldImUcQxBQW9hFVOu2JtWCO/5Rl7FkpzTpT4w98DCyoGCmtHoPksHvwcHU4fz1JOFV
         aQJO/AEo09OKlkS1MbPBAuakxet2GqQVUV2ijPNveM2Ah9uOFMFO4cteWc12CV6+wv3q
         jlRVjN4VdifIlaEBRrFgjFjE/CBH2VlQNd+cCZafnjs4mPuIPHsOwu5AInV7bdPGc+FY
         sGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=18zLq0gxDFVMpNFIuebbzGpXcEbEbepSMRwKNaKe0Ds=;
        fh=gsBvud5y41NiR3TfYRSoXfYovl/qUKPI1ssHJkdc5pM=;
        b=HzvYNM1mk0JOIcyyh36WgZjZuHPCUPw8eHDPzpar//A+CFX+n23G5ZLnMp30JihLMj
         V24+GSqUAShv6ze5ZgYqLf+aN/sme7omfqP0zw2PTPyQN9JKlFDOO/thjUvbsZS7BkFC
         TCV4tKckrJJr6LJ24rSGrPJH3ODCo+INOnHTvFNdQO5d8mq69q4lljBT9fA8PKmzoGP0
         74+CvhNGJSZoq9FkuJ9OuvJRLki0NSIFz8T/l57iCAmqYFVHe1BGcKPLlMU9F8gu/2ra
         j5qJrVfQ8stQQ7G28ElPEBqqZqoQX89pHy9uXrWXOL9JG55RGuo4jc/deOBZjl3dmZ+d
         UhNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790842073; x=1791446873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=18zLq0gxDFVMpNFIuebbzGpXcEbEbepSMRwKNaKe0Ds=;
        b=E3hwn5FGUIcK9ldfaqmc2LF8LdTA6bAz8tY8cYVssVBIGar3uwDcTuyE39v25MPVSY
         6A2hosd9DZzg2cSp3B3OIImhKfTEtNojoL7sYGfWpzsHfE+23wkdoGxd0TV7bqCJDkwG
         WEcAsJDlye3yLddX0Ctu0MtPDy3BYaGnh01k4Bw6fIaYT5Wqv7L9EGi+PhQKLT6vGstF
         y56R5U1M/AVc9YpMlWAawApFj5Unsl7va8wYNoVwPzWqoLAqTNEnPuUkM1reCuWk68Y1
         +brhaS7XutlpEdDPVAFwO98VOCEN/vnLGgKIbiLUueukBs1u8ZIEX3/u3woBUqubClAB
         LqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842073; x=1791446873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18zLq0gxDFVMpNFIuebbzGpXcEbEbepSMRwKNaKe0Ds=;
        b=VFVM6T46A1EPbWKzSP6pcBWdz+Ml6hsHcQyV9p+rNVYPMzQL/bdSmDcByoNRIkjujo
         n4Kj67TIX/8K+w+BkwEmwpkUHYEsKwjcAwQFprMWt2OhCm/M7HamJix7hya6v2lDubW5
         D8GSGYzRKjSsLRV1kgXBQ3zCFmugk1DLGRnTfcvKgGoRv/2Pn37KUYRXj9YraIpYZ0qv
         P6u1Fma6VXvJm0Ed7uSMDV+71SRU3O5UC/SipThChIp+N4cggRhNzaqlCViJ4P3XXUzX
         N8TMASsTYzIjwpiAZy4iczxbtIUMMLB4KufrAuPK21d3aLjkEv/tFi+rRNym7wx+qEGD
         I6Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxeMidl9BgwqjjbU/DAmEiGuhD/X0A2+jyFRfbqXmxlTzxsqiC3elODRKvr8M5AeOBedrP7t5X/L/GZ/lz0uvao6A==@vger.kernel.org
X-Gm-Message-State: AFuF++mTi/JbuI9slQlwB+3A8VHe1DiUWrzQdoqQUP3LFLihdVvhomLG
	kNWDesU6knQCZUUYAIaRN5J8QhWsrOHoGb5i5nXEl8PtAlikHqH5fy5mYwQ2zrRRJB51yoVhpiX
	DhW60sJrJV9i+3XkteMzAlj2CximvWNw=
X-Gm-Gg: AYBFou1wp2QPr9bx81LcD4Psx1IP+mh8cGZF9rgR/PmZ0ser9Ata8G0GFaqvzVxNhJV
	/WX/m58R3AsGBiyLy8t4W5lDXPWNceQymBdzP8J22HX3iPzf/yD1b5FS4IEn1N4Uy4tsKgVBSLQ
	SX5kyPFt7x2AZH0UaKRbxQNxE7h8g789HjE9nH/rO0UHOn8q/U2XKhy1T+ovbKZl8E7SFPGDZUy
	KslmGtTCjVBB3WUeAExzQToEeUfD9xOBKButNsdqcarYTZB01gnapGpXFB7sDI1KwjiluOw0bKA
	IKwlrqyzujHdrVieROrJPYCdLkECY4970G0LYoNj3bsefykOzgQzjSaNq6YpxfrJZOXpWRI87cS
	XWR22GPRvfl3+24c8/eTVm2RPzhdwTg6Qv9t9vKL+iw==
X-Received: by 2002:a7b:c319:0:b0:49f:bd43:5a1c with SMTP id
 5b1f17b1804b1-4a01eb388aemr28276965e9.15.1790842072599; Thu, 01 Oct 2026
 01:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com> <20260930133257.23210-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260930133257.23210-5-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Oct 2026 09:07:25 +0100
X-Gm-Features: AclHuK9cX00JQ5BRsiOahPrZyoL_jqZij1NEb2GdYg1yn5CCJaNcWxmYljLqQbc
Message-ID: <CA+V-a8tQZONUkeZYFBTvO+L+FTnrq6AE_aJQsm7MFX9CBnA-8w@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the patch.

On Wed, Sep 30, 2026 at 3:47=E2=80=AFPM Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The register for controlling power to the DSI region is in the SYSC
> (System Controller) block. Add support for controlling the DSI PWRRDY
> signal so the driver can efficiently manage power to the DSI region.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped pwrrdy variable from struct rzg2l_mipi_dsi_hw_info and instead
>    using feature flag RZ_MIPI_DSI_FEATURE_PWRRDY
>  * Dropped rzg2l_mipi_dsi_pwrrdy_off() as it is taken care by
>    devm_pwrseq_get().
> v2->v3:
>  * Updated powerseq API names.
> v1->v2:
>  * Switched to power sequence for handling pwrrdy signal.
>  * Dropped header file regmap.h and mfd/syscon.h
>  * Added header file pwrseq/consumer.h
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index d67e1230b70c..5263b2b8f1ca 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/units.h>
> @@ -38,6 +39,7 @@ MODULE_IMPORT_NS("RZV2H_CPG");
>  #define RZG2L_DCS_BUF_SIZE     128 /* Maximum DCS buffer size in externa=
l memory. */
>
>  #define RZ_MIPI_DSI_FEATURE_16BPP      BIT(0)
> +#define RZ_MIPI_DSI_FEATURE_PWRRDY     BIT(1)
>
>  struct rzg2l_mipi_dsi;
>
> @@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
>         struct clk *vclk;
>         struct clk *lpclk;
>
> +       struct pwrseq_desc *pwrseq;
> +
>         enum mipi_dsi_pixel_format format;
>         unsigned int num_data_lanes;
>         unsigned int lanes;
> @@ -1396,6 +1400,25 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops =
=3D {
>   * Probe & Remove
>   */
>
> +static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi)
> +{
> +       if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_PWRRDY))
> +               return 0;
> +
> +       dsi->pwrseq =3D devm_pwrseq_get(dsi->dev, "dsi-pwrrdy");
> +       if (IS_ERR(dsi->pwrseq)) {
> +               /*
> +                * This platform requires a sequencer. If we can't get it=
, we
> +                * must return the error (including -EPROBE_DEFER to wait=
 for
> +                * the provider to appear)
> +                */
> +               return dev_err_probe(dsi->dev, PTR_ERR(dsi->pwrseq),
> +                                    "Failed to get required power sequen=
cer\n");
> +       }
> +
> +       return pwrseq_enable(dsi->pwrseq);
Do we want to add a devm action to disable the pwrseq when the DSI
driver is removed?

Rest LGTM.

Cheers,
Prabhakar

> +}
> +
>  static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  {
>         unsigned int num_data_lanes;
> @@ -1454,6 +1477,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_de=
vice *pdev)
>
>         platform_set_drvdata(pdev, dsi);
>
> +       ret =3D rzg2l_mipi_dsi_pwrrdy_init(dsi);
> +       if (ret)
> +               return ret;
> +
>         pm_runtime_enable(dsi->dev);
>
>         ret =3D pm_runtime_resume_and_get(dsi->dev);
> --
> 2.43.0
>
>
