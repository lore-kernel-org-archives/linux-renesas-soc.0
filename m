Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793713623;
	b=KVql8hjFbfjotysluW5J5VC6Pq52A+ExAWqxyXqQb1JKFjnXcbeL8oCujUHOGAcuYCXy
	 7CQBWiNwdVyNtVeKllbsLXcw1kkGXUmICCpYrq4lUTDjgks92SoFIxEX4KmMVV3ibTELN
	 hkR50jrBbmBnf6kJfLfXDM69g4TpKNk4FBG59J5BKCkpE/c6LmcIH14qtbAmpzLaZCAE8
	 11zdTIoF2oJdhqgc9U2MQ0CcHFE0hkUzeiMeXx3LVX6SCAne1JDXQx9TQ4I4MRxAwgQ1t
	 xqRpbdwa/yktSpSYfg91inBiHfd+5Ako5xkqkVXvpn+wUuX88mpnYCD/2w40q/X7fcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=La9vG3Mj+mF1A1DWo8VhGSu4l9YLa9wPpX/8B3aLPII=;
	b=k8rGemVXb6d3iK+HGPGszgMfXX3avTrQhbAv93U5+a4cfVBN76p3k13FIbFsI1tU5R20
	 f6qTeRhN1KK8iDk2fiz02tHbe9Z+x0AjHFtPwkWGr3GxkB+C3keCKRZ4FO5Mn+qW2k2dI
	 W1+KNj4SF3pdHQjEKX1GQtCPoQTC1W3RA0n+rdc8pjSzXlo7MDrZyL23SalVcyFwU17Il
	 NobqC8fEQ6tC96+K6cEOhmWPM9mmhHegyLMbHBdGzAVS7j3AGS9oW4HTPaw/EtSt6czhD
	 63Do//qo8AVe997uYbjquXSicDf6eH1L0ALE3bLe+wXfPyucSVS5Fy1/3e+kjAQUm9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqI2hhZx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7F606A335
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 13:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B7F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqI2hhZx
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b060ec084so2484246f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 05:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793713621; cv=none;
        d=google.com; s=arc-20260327;
        b=CiHGEDmNIBqFvFKSfHGD1ucWBREVA8rfoXzJ9+GrLFicPFAI4c2Glb8/S9msYPl4Wg
         +IbK7bQrNYWqe7smXyxpwwHuJFbeMOnHa2J9RHwwBTlTmfw7lH9avcgImrc6TTz/2Naj
         B8EWr2HmEeZnNkVBVQpB+gwsQjgCl0/vUzIQCWDcoYiX4LbvvnNpFjkLsJDp/nTB0L5A
         sVza/lhSRr8lZabBwdJuCBJdddP4+4wF2ghqTSGVQNWEQp+uucxkmaH8I/hzkHrWq0eM
         8Vt+8Aad9draWusm61r/WK/tdlLdSg0ychx4W5QmyL3O70gBo6iPC5psQe//qK5pI8a7
         PcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=La9vG3Mj+mF1A1DWo8VhGSu4l9YLa9wPpX/8B3aLPII=;
        fh=7MtA4Ho4nFCDb0g/ZAQQlWq0TGsgHAoIxm2csgSmpUA=;
        b=KXPIDS73anZhKiAUGYsqNxoZm56oHrB/auSOXdkf1gSV0hdBD50z+CZzDhTcrwx6pG
         435lu8r4m8wADXtvaKgrdqTok3s/eSBNwhEjS8muv53109FWmjD001PUs6Hrx5My5dpN
         DZdJxGrOh23Z41Fn9+8IZtMZpRmgLZm+1VFGr0ft3rKqol0pajMX+ba3UyZf8DIeuxCt
         yPbEKhZyI+nD8HxI69YVFOrcAA609JHQGbC569H7xHp9WQT1lgFFvQ1S4kTNdk5DsuYz
         Le8a1JS11PuNK2S6MuZH8pgTZnw+Q199dTmK4gaZgxF/6vwISsNDKrq4sqyKBYZ0VwZj
         adVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713621; x=1794318421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=La9vG3Mj+mF1A1DWo8VhGSu4l9YLa9wPpX/8B3aLPII=;
        b=lqI2hhZxOjAyL5r3Pfj2A3k2A5QawkqpHiXRPUZAJOD0I/jRvSQK6C+lsOItFISTf/
         sMFPMc17ZRm5yHuSaBLRkyuQ3CaS/lC56i73OUiGW8vpkqyjK3KjRQGGaKGMP5t+A6dz
         4GvtLK8siLTaI866PLVrLnohJaOiVZtiDE/VxY4ZvP1SLlwFrsM0Ho0kkiUZGBFVv0Ee
         K3KzOIrfOrJnuGRlDvo24CB8siaEKaHFuBrn2FEtuK+YD5dUMQyn+BvkHPp1+FgQelF+
         HW4hxvirnsJ0RBm7qZMwiAwaKEszspX+Ejg2uP5yrtLrHDQjMKjN41FVK8XDrWMxzXcE
         xuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713621; x=1794318421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La9vG3Mj+mF1A1DWo8VhGSu4l9YLa9wPpX/8B3aLPII=;
        b=TzUpHXFkMEbb6qQxcd8n4k/vIIFhupIoD9k3ec/6bKoOQAyAj77fFpYiaYLC9a0dN7
         axIoYAkbmCeHOJFnzeBBoNLfwpQ14OOxHYjO0nHSHHhIlLWnBspAxea/S2vVYbXQqY8r
         r4bNQkhVHMNvD0wLAoMMLcgFH8QZb7rnZC9KK5wkUE3So6z2KL7t44K06horndtzGpNV
         glsjKAsJQ1twCdshzTSkJRlDNAXB8Y0ZbfOqsVOd4Gu+QcEAg/a2iWddTiFu8ZxIDdSU
         iZC/sJCK0Rx2RsjFty45nSPnCqCA8IB0X3SxuI+/pa2KXEBCDIrdxifpQrnacyS7zepO
         5P2Q==
X-Forwarded-Encrypted: i=1; AKwUvByfVT4CYBEgnkOyecqmWVvzg3Hr+Du10a6EgPUFKd/A0c/jn9PipqKfLqdxUfo4UvQaI6mRUvAo+BKoqOjp2J8FdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HStioobAGuYI3RaaMozTZxzzJIjMnXOB646F3anhvCjInEzcU
	8k2iY3w+tCdKbMBAfWq2ouF3p/52/7DZFSQENWpaWzGv1cXmF+hcLQv/7Ajuv3qGMLt472dfNo0
	kJgFA7s8I7lxiI5LmbPGBLMiDmObsZZA=
X-Gm-Gg: AYBFou29uke8G/0iBBOevweNyUFZsDtBQgMTHfhDkzXG4nIJh3mqswLOgwcoCXbH5nR
	h7qQZX76mQKVgRnh73dWkyuFEMRomOO/nzCZegyN02gIi80L0W5FglULhX2RytPzwrIaevehGJg
	MRepbTCTlLEIHEdyWSARVSWwd4DTYmgyPzF2+nnARMVif2OWTrNsbRiHy48redB+qONkqtTDwMy
	oDd114eliU4NTXCdy0VquikSh1puny+KSEvuoCD63wGjK8VB9K37QJYz5Si4Ew60C1jTNKRD44D
	rZvzJkvnMhm8Rza2oWo6v2TXe89WQekynnWK3O07a0OAQk13OkvlBbHdXSo2/G341AvwUlz8g9T
	BkCjPBHOGGu/rg3tQdds+ZY/+wWhh82dsYSnoLHeGdCFhD/9qWhNeCcbdY+ZQrPsF8o+pNNfDd5
	LVXPH3+RPrmpSWDkNyV7J3JYaTUO84LlUruhTr9luqQoMuhqexe1d7Vuns
X-Received: by 2002:a05:6000:2f84:b0:48e:e98:8b64 with SMTP id
 ffacd0b85a97d-48e6e2eb232mr28145688f8f.19.1793713621222; Tue, 03 Nov 2026
 05:47:01 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org> <20261027-mali-c55-renesas-dts-v5-7-51bbb43969c1@kernel.org>
In-Reply-To: <20261027-mali-c55-renesas-dts-v5-7-51bbb43969c1@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 Nov 2026 13:46:34 +0000
X-Gm-Features: AclHuK_bXy2F5RYTq_Hmfm6bUMMn_NX9bzMEbVYq6-tx7g9y72NhS57yx-JuKls
Message-ID: <CA+V-a8vEub2y2gvXp8jkjVHOGuj1Eqkbq75t8Nezz95iidtL3Q@mail.gmail.com>
Subject: Re: [PATCH RFC v5 7/7] media: mali-c55: Sequence resets explicitly
To: Linus Walleij <linusw@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the patch.

On Tue, Oct 27, 2026 at 4:25=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Reporters avoid a register-access hang on RZ/V2H by swapping the first
> and third clock and reset identifiers in the ISP node. Test the reset
> ordering from that configuration without changing the DT assignments.
>
> Acquire vresetn, aresetn and hresetn individually by name, retaining thei=
r
> optional shared semantics. Deassert them in that order and assert them
> in reverse order. With the current RZ/V2H DT, this deasserts 0xd3, 0xd1
> and 0xd2 and asserts 0xd2, 0xd1 and 0xd3. These are the orders produced
> by the bulk helpers with the reported working DT swap, since bulk
> reset deassertion traverses its array backwards.
>
> Preserve the bulk helpers' error rollback. A shared reset increments its
> deassert count before invoking the provider, so a failed deassertion
> must also be balanced when unwinding.
>
> This RFC tests the driver's request order, not simultaneous hardware
> reset transitions. The IVC can already hold shared resets deasserted.
> The report changed clocks and resets together, so this ordering still
> needs target hardware testing.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../media/platform/arm/mali-c55/mali-c55-common.h  |  6 +-
>  .../media/platform/arm/mali-c55/mali-c55-core.c    | 75 ++++++++++++++++=
------
>  2 files changed, 60 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/driv=
ers/media/platform/arm/mali-c55/mali-c55-common.h
> index b1ac50d6b30e..f2cd4d4ef472 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> @@ -38,8 +38,6 @@
>
>  #define MALI_C55_DEFAULT_MEDIA_BUS_FMT MEDIA_BUS_FMT_RGB121212_1X36
>
> -#define MALI_C55_NUM_RESETS            3
> -
>  struct device;
>  struct mali_c55;
>  struct mali_c55_cap_dev;
> @@ -239,7 +237,9 @@ struct mali_c55 {
>         struct clk *hclk;
>         struct clk *aclk;
>         struct clk *vclk;
> -       struct reset_control_bulk_data resets[MALI_C55_NUM_RESETS];
> +       struct reset_control *vresetn;
> +       struct reset_control *aresetn;
> +       struct reset_control *hresetn;
>         int irqnum;
>
>         u16 capabilities;
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driver=
s/media/platform/arm/mali-c55/mali-c55-core.c
> index 0caef871cad4..47e26d85784e 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -64,12 +64,6 @@ static const unsigned int config_space_addrs[] =3D {
>         [MALI_C55_CONFIG_PONG] =3D 0x22b2c,
>  };
>
> -static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] =3D =
{
> -       "vresetn",
> -       "aresetn",
> -       "hresetn",
> -};
> -
I tested on the RZ/V2H EVK with the clocks and DT left untouched,
changing only the reset order.

The hang comes from the reset assert order in __mali_c55_power_off().
Asserting vresetn (the ISP core reset per the RZ/V2H manual) before
hresetn/aresetn wedges the ISP. The next power-on then stalls on its
first register access. The deassert order doesn't matter.

Asserting h->a->v (deasserting v->a->h) passes repeated runtime-PM
cycles and also works with the IVC enabled. So 7/7 gives the right
reset sequence, 6/7 isn't needed for this, and the existing DT mapping
(0xd3 =3D vresetn =3D ISP core reset) is correct.

A smaller alternative keeps the bulk API and only reorders the names:

+/*
+ * The reset bulk API asserts the resets in array order and deasserts them=
 in
+ * reverse order. The video core reset (vresetn) must be asserted last, af=
ter
+ * the register (hresetn) and AXI (aresetn) interface resets. Otherwise th=
e
+ * ISP can be left in a state where the first register access after the ne=
xt
+ * power-on stalls the bus.
+ */
 static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] =3D {
-       "vresetn",
-       "aresetn",
        "hresetn",
+       "aresetn",
+       "vresetn",
 };

Cheers,
Prabhakar

>  /*
>   * System IO
>   *
> @@ -661,7 +655,27 @@ static int mali_c55_init_context(struct mali_c55 *ma=
li_c55,
>
>  static void __mali_c55_power_off(struct mali_c55 *mali_c55)
>  {
> -       reset_control_bulk_assert(ARRAY_SIZE(mali_c55->resets), mali_c55-=
>resets);
> +       int ret;
> +
> +       ret =3D reset_control_assert(mali_c55->hresetn);
> +       if (ret)
> +               goto disable_clocks;
> +
> +       ret =3D reset_control_assert(mali_c55->aresetn);
> +       if (ret)
> +               goto err_deassert_hresetn;
> +
> +       ret =3D reset_control_assert(mali_c55->vresetn);
> +       if (ret)
> +               goto err_deassert_aresetn;
> +
> +       goto disable_clocks;
> +
> +err_deassert_aresetn:
> +       reset_control_deassert(mali_c55->aresetn);
> +err_deassert_hresetn:
> +       reset_control_deassert(mali_c55->hresetn);
> +disable_clocks:
>         clk_disable_unprepare(mali_c55->vclk);
>         clk_disable_unprepare(mali_c55->aclk);
>         clk_disable_unprepare(mali_c55->hclk);
> @@ -702,11 +716,23 @@ static int __mali_c55_power_on(struct mali_c55 *mal=
i_c55)
>                 goto err_disable_aclk;
>         }
>
> -       ret =3D reset_control_bulk_deassert(ARRAY_SIZE(mali_c55->resets),
> -                                         mali_c55->resets);
> +       /* Release video, AXI and register interface resets in that order=
. */
> +       ret =3D reset_control_deassert(mali_c55->vresetn);
>         if (ret) {
> -               dev_err(mali_c55->dev, "failed to deassert resets\n");
> -               goto err_disable_vclk;
> +               dev_err(mali_c55->dev, "failed to deassert vresetn\n");
> +               goto err_assert_vresetn;
> +       }
> +
> +       ret =3D reset_control_deassert(mali_c55->aresetn);
> +       if (ret) {
> +               dev_err(mali_c55->dev, "failed to deassert aresetn\n");
> +               goto err_assert_aresetn;
> +       }
> +
> +       ret =3D reset_control_deassert(mali_c55->hresetn);
> +       if (ret) {
> +               dev_err(mali_c55->dev, "failed to deassert hresetn\n");
> +               goto err_assert_hresetn;
>         }
>
>         /* Use "software only" context management. */
> @@ -741,7 +767,13 @@ static int __mali_c55_power_on(struct mali_c55 *mali=
_c55)
>
>         return 0;
>
> -err_disable_vclk:
> +       /* A shared reset takes a reference before calling its provider. =
*/
> +err_assert_hresetn:
> +       reset_control_assert(mali_c55->hresetn);
> +err_assert_aresetn:
> +       reset_control_assert(mali_c55->aresetn);
> +err_assert_vresetn:
> +       reset_control_assert(mali_c55->vresetn);
>         clk_disable_unprepare(mali_c55->vclk);
>  err_disable_aclk:
>         clk_disable_unprepare(mali_c55->aclk);
> @@ -818,13 +850,20 @@ static int mali_c55_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(dev, PTR_ERR(mali_c55->vclk),
>                                      "failed to acquire vclk\n");
>
> -       for (unsigned int i =3D 0; i < ARRAY_SIZE(mali_c55_reset_names); =
i++)
> -               mali_c55->resets[i].id =3D mali_c55_reset_names[i];
> +       mali_c55->vresetn =3D devm_reset_control_get_optional_shared(dev,=
 "vresetn");
> +       if (IS_ERR(mali_c55->vresetn))
> +               return dev_err_probe(dev, PTR_ERR(mali_c55->vresetn),
> +                                    "failed to acquire vresetn\n");
>
> -       ret =3D devm_reset_control_bulk_get_optional_shared(dev,
> -                       ARRAY_SIZE(mali_c55_reset_names), mali_c55->reset=
s);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "failed to acquire resets\=
n");
> +       mali_c55->aresetn =3D devm_reset_control_get_optional_shared(dev,=
 "aresetn");
> +       if (IS_ERR(mali_c55->aresetn))
> +               return dev_err_probe(dev, PTR_ERR(mali_c55->aresetn),
> +                                    "failed to acquire aresetn\n");
> +
> +       mali_c55->hresetn =3D devm_reset_control_get_optional_shared(dev,=
 "hresetn");
> +       if (IS_ERR(mali_c55->hresetn))
> +               return dev_err_probe(dev, PTR_ERR(mali_c55->hresetn),
> +                                    "failed to acquire hresetn\n");
>
>         of_reserved_mem_device_init(dev);
>         vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
>
> --
> 2.56.0
>
>
