Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCCF3B6BE5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355209; cv=none; b=XYy2uvqZE5B1Y/R6TPUKNQXARNRj13A3FiBYkZMkQ+CtLcB/OwKK6C+0oQZ3dHFb+jcoMdtABU25GZAtOG+csGzz3iCAHX5yeLXeR6HeNP1emHyQRf10wD5ZnAgyXCNqJ7ytFW2/BIQqTDHTBjSjJ7Uz/INeVTKYu/TQ7Z5HDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355209; c=relaxed/simple;
	bh=o9LVP7ZwCEXKXc81BedJatEJdL6CnPhLVwnMMuK60Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRN0Gh/FPlBehzSsPxN5QClOG10SgfEN7SL0hvx8vSPaS270u4gQXt75M1SBlfDV9mXEin+ffxOtvCOp3ZKRMUMYO6+zSdEyvfJ/xQIbTVxD+dFVkYp2GXWpW7xPpG6dlxmWTbuZP48BlHVpifsw8ClI79/mxdzte7tCpk7HA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78ffc0e2f23so337342137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 09:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355199; x=1790959999;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AAZeiUPhNHAKQzyrs52ow84PpNXxw5BqfAwfRumsq84=;
        b=06N5sqAGL37qMGCLDbUs/wJVpnZiXqi2PIGTcn+G+4u0Ui3Er56mnryJTFSwGApB1H
         Kh0Em9B9+poJ+UO1xxoefcLBWYQOEgyrNES/HoEfCRLQyo/ZYxk8lKixA2K0moebbjRq
         Z5E/8krrne4a0ALnCn3TnjH4NPppgwD5k6ach/zCCm43vG9VLK5LQiR1e0u/IPBEvNLQ
         KQ2EpBHkTbzl8fkaSrEjUIUAqXCbEuFGQHi3SDxYe6qMuTqEc6uTKEZqp2SjbzYGPmQb
         +OcXKVxuJD5VGzGqhalr9Asrc7yYJXH0V4E7KnhnbM5tIyNMRiZzKXmLyYDFQbUNxBq9
         zTbA==
X-Forwarded-Encrypted: i=1; AKwUvBymw6rWPzq0ZsquCPJbO/gZS5UnGgSEpBVJEN4YBpinIkLybzR62Fi9mR9kIuOBckRc7MOYVp/kSAXINlAyxfXSng==@vger.kernel.org
X-Gm-Message-State: AFuF++nn09gVw7o9/aaJm0w0NlBxoNILbS/xoug6j3rOjpp0vM3z0azH
	+qoHyWbV1TWHrgx6EEuBddWrbAk2+gZvLFhpupKruqf/Qk4CuxLiHjKa3kyydclb
X-Gm-Gg: AYBFou1kk2z9jxIWAIPezhvLGkGfZg9tU9KBNT8MGwMHCHW9RnfmC+XAS/lOrhpY3ve
	QlwxTBvJRFN1VmsoloCdT4ifAykY4YBCTGq4IogIGr3B6e5u4GsTxjHVh7OCTXD5keE+XEgFjsY
	TauWslcQJAQopCtkvlMZLzKwXW+6wHJtTxudNUcBBGtEIceTIv0mLcjAsmiCI+fvsf96FMWsZ/2
	IQM2xFjNsccYWDmnGO9CafKFdwPKxbOYrtjEbgyBGNoC7cwTiGPJY32OE81Kl29vba/HYs8Zlcs
	b14h5fathrGKjrc7Cps1Pnlx/VAlH5NgyL8irVxD86LkLQ/FiEAlMYtzGCdcEZyosuhmAnbXg8A
	Uf0bd9sT5tks7BoqvukxgPQJnIZNq71pUohKyyBPxSJ7/pqjpC2R+TXHBlQNIe04wfXirJSdtT+
	x8O9xBZhyTJtUecAQRvIG5u5RvbEhRwP2o7BNgTkVSC0AYUbf123x7f2PYjaDMO1qfY2q13UVGR
	5ZHj9Cim4hE/B8IuL3nerWWrTAprtBV+aOs
X-Received: by 2002:a05:6102:162a:b0:7a5:1d50:ac35 with SMTP id ada2fe7eead31-7b1c76179a1mr939016137.21.1790355198989;
        Fri, 25 Sep 2026 09:53:18 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861b03db5dsm3529911241.10.2026.09.25.09.53.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 09:53:16 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b35eae3076so52793137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 09:53:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0WkXshd3gf8HbpXNSVDiLwsk3dlvfJgCDkj9WUHoQU2jyBS014y9j8QW+lk6LgC5DKEw+HWk16B61v7JSZOio9Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7b1b34d3523mr1094599137.0.1790355195965; Fri, 25 Sep 2026
 09:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-miic-validate-dtb-v1-0-3a6db9bb75ec@reliablecontrols.com>
 <20260925-miic-validate-dtb-v1-1-3a6db9bb75ec@reliablecontrols.com>
In-Reply-To: <20260925-miic-validate-dtb-v1-1-3a6db9bb75ec@reliablecontrols.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 18:53:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_UC--78P4tHriUpQeNqd7Vj01vWai0RNaT-dwS3O4LA@mail.gmail.com>
X-Gm-Features: AclHuK8y_vFWWqcLu3lD0-xDavR-ZA4Z4hJ7pGA6sis8cejUzuNuA7WzsLWOS9Q
Message-ID: <CAMuHMdX_UC--78P4tHriUpQeNqd7Vj01vWai0RNaT-dwS3O4LA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: pcs: rzn1-miic: Make usage of
 miic_port_max consistent
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kyle,

On Fri, 25 Sept 2026 at 17:20, Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> miic_port_max is used both as the last port number and the port count
> which can be different depending on SoC numbering. Use compile time
> information to always set this as count and fix logic that was expecting
> the last port number.
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Thanks for your patch!

> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -59,6 +59,8 @@
>
>  #define MIIC_MAX_NUM_RSTS              2
>
> +#define MIIC_PORT_END(x) ((x)->miic_port_start + (x)->miic_port_max - 1)
> +
>  /**
>   * struct modctrl_match - Matching table entry for  convctrl configuration
>   *                       See section 8.2.1 of manual.
> @@ -222,7 +224,7 @@ enum miic_type {
>   * @index_to_string: String representations of the index values
>   * @index_to_string_count: Number of entries in the index_to_string array
>   * @miic_port_start: MIIC port start number
> - * @miic_port_max: Maximum MIIC supported
> + * @miic_port_max: Count of total MIIC ports supported

miic_port_num_total?
"max" has a different meaning.

>   * @sw_mode_mask: Switch mode mask
>   * @reset_ids: Reset names array
>   * @reset_count: Number of entries in the reset_ids array
> @@ -482,7 +484,7 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
>
>         miic = platform_get_drvdata(pdev);
>         of_data = miic->of_data;
> -       if (port > of_data->miic_port_max || port < of_data->miic_port_start) {
> +       if (port > MIIC_PORT_END(of_data) || port < of_data->miic_port_start) {

IMHO the asymmetry makes the code harder to read.

As this changes the logic, I assume this is a fix?

>                 put_device(&pdev->dev);
>                 return ERR_PTR(-EINVAL);
>         }
> @@ -822,7 +824,7 @@ static struct miic_of_data rzn1_miic_of_data = {
>         .index_to_string = index_to_string,
>         .index_to_string_count = ARRAY_SIZE(index_to_string),
>         .miic_port_start = 1,
> -       .miic_port_max = 5,
> +       .miic_port_max = ARRAY_SIZE(index_to_string) - 1,

Why the -1? Oh, because the first entry of the array is not included.

>         .sw_mode_mask = GENMASK(4, 0),
>         .init_unlock_lock_regs = true,
>         .miic_write = miic_reg_writel_unlocked,
> @@ -838,7 +840,7 @@ static struct miic_of_data rzt2h_miic_of_data = {
>         .index_to_string = rzt2h_index_to_string,
>         .index_to_string_count = ARRAY_SIZE(rzt2h_index_to_string),
>         .miic_port_start = 0,
> -       .miic_port_max = 4,
> +       .miic_port_max = ARRAY_SIZE(rzt2h_index_to_string) - 1,

Why the -1? Oh, because the first entry of the array is not included.
And it is not related to .miic_port_start, which is zero here?

>         .sw_mode_mask = GENMASK(2, 0),
>         .reset_ids = rzt2h_reset_ids,
>         .reset_count = ARRAY_SIZE(rzt2h_reset_ids),

I'm not sure this is an improvement at all...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
