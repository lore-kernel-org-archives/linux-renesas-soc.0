Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793712096;
	b=pTAY9gC4bccpnl2ZMPxR5lB0Dew7+ut7FhLJ6hbVHF0Ms89Edhcv155F9ndabb+4bkcq
	 gjEBZJnT26RGqzenOsV0Tfwk2SbdluAreaZsLZLJuKQKUrRxRhvKIcNgmfxn+g4KdBd7Q
	 98BKKwT9X9s0uIMjZBVFJCxzPh1QvNxNSc3yalaEmPpdc84wWyRlqLSHUb0YLsErYAqe/
	 nYrlgIVKc3fzdb8X7kwl06shhK6eZe7JcfUXIrTJX7ZcmFTIrTbzrx2xQe5jMFXq5deVd
	 nTg54Vo962GCwMQSJkjaBqUn3Di9+/kNaAhy57cdH1gkkdvodCNTkYzsLT2ox+gfXrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PjezoB+WoJb2SbwVN0TbHvFej4S1jgvLlMQHUliN/2s=;
	b=T5Yyh3bAHlQw9vhmzuzueLvTkCVY4LwsgyET+j3XpG0/8Obpi1AHHco6B3+HqewNpzTU
	 7kq71Io9vtCDSA+4NcQvxT5wrhjK/QdxLvyfOr1dDNsCXnsPRXyoC2n6hNg30jojTvu67
	 TwGvUa2R9rfrC1MV/aFM2a8QFMK+7kNdYje8vyZdFlvY7dzP/sl2tjEO0L/M/q1S5JIH4
	 fQ3OIxrhGCo+qwS3uY+K9BiDs1RN2lJuC5d03nKP1oSmM/hnkxhT1U19ZKmAUtoD9uMfe
	 ahV+798WTejtbeWfpBPhM3bueO/HHgZ4MmWdyGYbnBAaWhO7twgcEAtdNiUCRXoGdcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppIxAfDy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA45606A324
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 13:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA45606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppIxAfDy
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e10a70540so2371722f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 05:21:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793712094; cv=none;
        d=google.com; s=arc-20260327;
        b=N4XIXu06mojXiUwdX7vkT38kTHz0iWWp19PCR2wySjykfmCua+LLTwRyun4qVRfRVN
         tqPFIm0HcQjyKivra/O1SwUjxzdWLI4fJDc8SqOC2EMksCVbgCAikprULyHU44youXtv
         gex+WlduP1UOaC+VqZOXpW1lqCJ+8d6ww4ieo0193Budr0AFuVLQUu1ugt48BdwFznNX
         K2LpBBIZBv0wTSv8ifHZjoX5W49wLvbrBvjtHfDLcwXOC4i1YVzpwW85/Nu/jB86IIMA
         AraU0mPBZZySbG22JuIighCBV/qvvFVDnSTK1ObvBra9cwnsDJfDniv6BUR3jfo4+xy4
         wVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PjezoB+WoJb2SbwVN0TbHvFej4S1jgvLlMQHUliN/2s=;
        fh=5/7MKUV+92toP5CNRq/1+0cwHjGW4lerV+N89cDhBIY=;
        b=R4ut7j5PODrxc3EzeFKTapAjaF6JGtwP/xaM1MFVrlHe3xnrrOcKpBpG9vAVzSBbwW
         U7w/p8WI98spDwHhDJR8+QTgUg7z7yFiYj4qIi01fUFi1yrU/s+flaYQ2PEaW1ZU4ppi
         ElsQyvS8wb6snTa3JI5pSN3AYoQUu2djSpCyzxCGAs2LR5xZrrfzeRg0cC1Ozz/kAnIE
         NQbilXlfDthVnHk4f9B5DHvLxLRLjnqs0jj4XKV0PR/I9nDhqXtUwrGrNQb9Qc48v9Vj
         3rWc5i+kVgH3cG4/ZbPofNfpY3ewFcaHGFz7nrr85WGr0xpr2X/UdRkaktBU6NFE5XUp
         PIug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712094; x=1794316894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PjezoB+WoJb2SbwVN0TbHvFej4S1jgvLlMQHUliN/2s=;
        b=ppIxAfDyejxmVRNrCU9nlhpV38W4e1y+hy4i85n0N8z6fcLbtH8AKnAR2nnKqGx7W1
         CTxAiq/hB8sjQ/BDzF4olJiQS2UyHQsMoZ2ECdK0lIucRyPOhhmClSfLdePVmhCm+f0/
         QMUQwJPJIL1/e/4/3r0iOI/QrGF2UHVPvyHqL/AmY/7F+ZCE+V42qyUiK2E20ZnW7mwF
         QPkKb/4AGVDglxu7xyMdB/vVSNvEMd+fXe2IcTxQ07ff5ZknRFDcO80U0Xx17VTly32m
         ZFxlFZVaEDqbTUYqxq0Y8WxgcF55sRxTAEx61rrL66i2sFClEl8VSoNzc0WtC/C/IJmX
         IZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712094; x=1794316894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjezoB+WoJb2SbwVN0TbHvFej4S1jgvLlMQHUliN/2s=;
        b=Iii0Uhg900xo906IDdDZkmf/7gLbR24XlcaSBxqMqHkoxucj149Q9e4qsiPE2Tywhf
         2lSlEhE3L4FOI1KX/ql7+n0r1rlROaPKOkkY9ugakEOTIhUWYuf21mOXDsHFXre9o0x3
         x48CQbbAtrB8kBs0iGlg82DKIWzxmrnVKlNCx6BL+2xooJiSc/7Q55LY2zBgo/bvudZX
         FmvquOv1o4Azirtlp8MLMqljh9BZCu5Pktv7I+gA4UvwUt0b4g9T1eLvoKj+aGcAcbHi
         ppFa2ACCjZEdJ20o6FcsFqn5O/IJMpO2HEo2z0Af+SljGvoTwQZ8MLr9ZLvVXP1H+Lha
         haUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOIREpGjjuD4rdfuDX2qfIIoFTnitl1dNxeFXgTopFPf6VmhfwT4X+G9qAIyf+nJmJgZMcNNURTinq1rmyqVVQyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8d+ganlW+RWZdddixGzw42Xx2b13lm/rjSjGhyTnah+ry91VMS
	VcFnel8Nuvg5GNn4vSbiTmgMNQjV3duZrqBrrqSmxhOOLVuPiIXIjnJtibGoZz5Fj7c1jX1p2G5
	55FrblKzz5vY/HWZs24+ZgUmKDd8HDyUQURpU
X-Gm-Gg: AYBFou1SMyrYyGJ6ISqO9XTb0QYVp+X/rp7b0F2+O8QfADPsNqvowlLaT2L1J1O2LA9
	tKskntZKRXageALKvygEkmGek4QxoIXIX2Esy7qZUytJ5Argw1vkIQF2H2Y8l48WdRQ13XiAxw8
	mBZ6zw7xbluN2WkYoBEuA9GIRpI+MF/8mAr80LkLerkNWNmUCon7HhHbNMFPjGv2Bi9qJ5XhQEV
	1dFt8asyo7SXrM3lKHU1jglSP7uW3ZtyuDSA7QSnLQ9ffDmuT1YN4fuBPR0W/tt0EUnH2y/OqIY
	T6t2quBStSsl9CwryCBW7jnSt/BhG3rWDgPuuEuX79tmCCwvOjxAHxQWv90AHhZqiKebLHJdoiE
	28PTBRr3/jMmKQM99LIW7fneY6mKB504ErHvs00qMjxUEKmPDalSMK0KKkt65aO+0Bj1RL/Q6z2
	vk8P+qy0ZvoHXKbLeLxTqOoTgB2z1vr3UdiMDfwm8TedwEpQQsaPaD3hrg
X-Received: by 2002:a05:600c:138c:b0:49f:ce78:3562 with SMTP id
 5b1f17b1804b1-4ac1765d3e8mr296257895e9.19.1793712093500; Tue, 03 Nov 2026
 05:21:33 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org> <20261027-mali-c55-renesas-dts-v5-6-51bbb43969c1@kernel.org>
In-Reply-To: <20261027-mali-c55-renesas-dts-v5-6-51bbb43969c1@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 Nov 2026 13:21:06 +0000
X-Gm-Features: AclHuK9pMJkD7kJPyn5f7uMVRbl_G_UlA_5Wqh7DVh-HzhZWtx4cZZpsd1kaJaI
Message-ID: <CA+V-a8tni=HfSUsCkOjhNNpS3puJnFG26JbkFd=sRi0MHpw7vg@mail.gmail.com>
Subject: Re: [PATCH RFC v5 6/7] media: mali-c55: Sequence clocks explicitly
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the patch.

On Tue, Oct 27, 2026 at 4:15=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Reporters avoid a register-access hang on RZ/V2H by swapping the first
> and third clock and reset identifiers in the ISP node. Test the clock
> ordering from that configuration without changing the DT assignments.
>
> Acquire hclk, aclk and vclk individually by name. Enable them in that
> order and disable them in reverse order. With the current RZ/V2H DT,
> this requests clocks 0xe2, 0xe4 and 0xe5, matching the reported working
> configuration. Unwind successful enables in reverse order on failure.
>
> This RFC changes the driver's sequence only. The CPG power domain can
> enable clocks in DT order before the runtime-resume callback, and shared
> users may already hold clocks enabled. It does not guarantee the same
> order of physical clock transitions as the DT swap.
>
> The report changed clocks and resets together, so clock ordering alone
> has not been shown to fix the hang. Target hardware testing is needed.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../media/platform/arm/mali-c55/mali-c55-common.h  |  5 +-
>  .../media/platform/arm/mali-c55/mali-c55-core.c    | 59 +++++++++++++++-=
------
>  2 files changed, 44 insertions(+), 20 deletions(-)
>
I think we can drop this patch as we are not seeing any issues with
clock ordereing see response on 7/7

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/driv=
ers/media/platform/arm/mali-c55/mali-c55-common.h
> index 13a3e9dc4243..b1ac50d6b30e 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> @@ -38,7 +38,6 @@
>
>  #define MALI_C55_DEFAULT_MEDIA_BUS_FMT MEDIA_BUS_FMT_RGB121212_1X36
>
> -#define MALI_C55_NUM_CLKS              3
>  #define MALI_C55_NUM_RESETS            3
>
>  struct device;
> @@ -237,7 +236,9 @@ struct mali_c55_context {
>  struct mali_c55 {
>         struct device *dev;
>         void __iomem *base;
> -       struct clk_bulk_data clks[MALI_C55_NUM_CLKS];
> +       struct clk *hclk;
> +       struct clk *aclk;
> +       struct clk *vclk;
>         struct reset_control_bulk_data resets[MALI_C55_NUM_RESETS];
>         int irqnum;
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driver=
s/media/platform/arm/mali-c55/mali-c55-core.c
> index f28e9f4354ac..0caef871cad4 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -64,12 +64,6 @@ static const unsigned int config_space_addrs[] =3D {
>         [MALI_C55_CONFIG_PONG] =3D 0x22b2c,
>  };
>
> -static const char * const mali_c55_clk_names[MALI_C55_NUM_CLKS] =3D {
> -       "vclk",
> -       "aclk",
> -       "hclk",
> -};
> -
>  static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] =3D =
{
>         "vresetn",
>         "aresetn",
> @@ -668,7 +662,9 @@ static int mali_c55_init_context(struct mali_c55 *mal=
i_c55,
>  static void __mali_c55_power_off(struct mali_c55 *mali_c55)
>  {
>         reset_control_bulk_assert(ARRAY_SIZE(mali_c55->resets), mali_c55-=
>resets);
> -       clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->=
clks);
> +       clk_disable_unprepare(mali_c55->vclk);
> +       clk_disable_unprepare(mali_c55->aclk);
> +       clk_disable_unprepare(mali_c55->hclk);
>  }
>
>  static int __maybe_unused mali_c55_runtime_suspend(struct device *dev)
> @@ -687,20 +683,30 @@ static int __mali_c55_power_on(struct mali_c55 *mal=
i_c55)
>         int ret;
>         u32 val;
>
> -       ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(mali_c55->clks),
> -                                     mali_c55->clks);
> +       /* Enable the register interface, AXI and video clocks in that or=
der. */
> +       ret =3D clk_prepare_enable(mali_c55->hclk);
>         if (ret) {
> -               dev_err(mali_c55->dev, "failed to enable clocks\n");
> +               dev_err(mali_c55->dev, "failed to enable hclk\n");
>                 return ret;
>         }
>
> +       ret =3D clk_prepare_enable(mali_c55->aclk);
> +       if (ret) {
> +               dev_err(mali_c55->dev, "failed to enable aclk\n");
> +               goto err_disable_hclk;
> +       }
> +
> +       ret =3D clk_prepare_enable(mali_c55->vclk);
> +       if (ret) {
> +               dev_err(mali_c55->dev, "failed to enable vclk\n");
> +               goto err_disable_aclk;
> +       }
> +
>         ret =3D reset_control_bulk_deassert(ARRAY_SIZE(mali_c55->resets),
>                                           mali_c55->resets);
>         if (ret) {
>                 dev_err(mali_c55->dev, "failed to deassert resets\n");
> -               clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
> -                                          mali_c55->clks);
> -               return ret;
> +               goto err_disable_vclk;
>         }
>
>         /* Use "software only" context management. */
> @@ -734,6 +740,15 @@ static int __mali_c55_power_on(struct mali_c55 *mali=
_c55)
>                            val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_=
MSEC);
>
>         return 0;
> +
> +err_disable_vclk:
> +       clk_disable_unprepare(mali_c55->vclk);
> +err_disable_aclk:
> +       clk_disable_unprepare(mali_c55->aclk);
> +err_disable_hclk:
> +       clk_disable_unprepare(mali_c55->hclk);
> +
> +       return ret;
>  }
>
>  static int __maybe_unused mali_c55_runtime_resume(struct device *dev)
> @@ -788,12 +803,20 @@ static int mali_c55_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(dev, PTR_ERR(mali_c55->base),
>                                      "failed to map IO memory\n");
>
> -       for (unsigned int i =3D 0; i < ARRAY_SIZE(mali_c55_clk_names); i+=
+)
> -               mali_c55->clks[i].id =3D mali_c55_clk_names[i];
> +       mali_c55->hclk =3D devm_clk_get(dev, "hclk");
> +       if (IS_ERR(mali_c55->hclk))
> +               return dev_err_probe(dev, PTR_ERR(mali_c55->hclk),
> +                                    "failed to acquire hclk\n");
>
> -       ret =3D devm_clk_bulk_get(dev, ARRAY_SIZE(mali_c55->clks), mali_c=
55->clks);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "failed to acquire clocks\=
n");
> +       mali_c55->aclk =3D devm_clk_get(dev, "aclk");
> +       if (IS_ERR(mali_c55->aclk))
> +               return dev_err_probe(dev, PTR_ERR(mali_c55->aclk),
> +                                    "failed to acquire aclk\n");
> +
> +       mali_c55->vclk =3D devm_clk_get(dev, "vclk");
> +       if (IS_ERR(mali_c55->vclk))
> +               return dev_err_probe(dev, PTR_ERR(mali_c55->vclk),
> +                                    "failed to acquire vclk\n");
>
>         for (unsigned int i =3D 0; i < ARRAY_SIZE(mali_c55_reset_names); =
i++)
>                 mali_c55->resets[i].id =3D mali_c55_reset_names[i];
>
> --
> 2.56.0
>
>
