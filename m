Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03FC41B8F2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601606; cv=none; b=VZLEGLokSw+VHrAzLbWPgQkcrYUQ56YAFKcC0h5illXz2AFL81d88s+HQ/79bj3JNzVGCj2gI91zpo6DyaOKU+w7wemH2GpOJOLwZDp6hhkG6EGDwJVtQlaZaRqta05XN9dbJ4MhX03v0IKsLioCuZSxF1sYQeuH/6sV1ShBNA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601606; c=relaxed/simple;
	bh=hjcSuw2cqnvjI5NI1/o5uMksKX3PcnQ52Y/4elq2HKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+rcY2Q/AuOQ+fS+e36Onc41xW7lnNcWTSWE1NQfvsz1Jpdncr981vBs5wcTQuNBBNYEs9uJ96CwSXVdd4nTMSJiG7hF4cstsdIU2a3dNmXt9KGDf/dVaQfB5jXq+CIPp/9TODF9rfFswdO2fWrsOFYcXS+S894yive1GAERGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b451f1e66fso929525137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601604; x=1791206404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+2hurtBCerXJa7Ue1vT5vjNfpc9Jv9KHDeVjKG0g9dQ=;
        b=K+MDtuN9RH18kYgZ9M7AOVDpdafOdPDoV9bvSekAMQjG31f/QGSKfuZzcon1hH5xnv
         Swke7kGQOwKgQjkLSaOyqqtlVhW4W1BYqyLGw3hQ8dLKxWAbMjq8BoJJzYzN5D6XubIA
         Lcovr2XsIJVpAObcmXHYuA0TmXRKMOfrdweCN9jfQzQ9wCg7U8DqxSoX93Zu8b51oOXP
         animyTm5XDwCHbImsUWdphIYYHTdbaH0xi5xGGixNh1gISZmTx+j/dSsw+VSJR/6pCgU
         lJH3uiSz1doAjB3/0dD6U3+w0um3dxnk/QW/8xh2FhQCHeiRv5Ge2pVzCOnUXXW4yxNh
         kdXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK1MAObjHJ6EwVqIWxjrhYESHr1S6amjCKbX7Ynd3+k2qlzFzbaUsfjLWeJQcbya8o/UFefVatjwSNEyhNPwkJIg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKVL1fpT3PKFhiqlkFVtRDZ7t0rEnm2pG3194XotuwO7M/kiEaO
	YBzT3YmxzacdmFqcotmGJLc/dVGjIhK4aZnHvW+6V3gVSvgnFr8w3qYj4jr3M3+l
X-Gm-Gg: AYBFou1BfVT+ewhfqT1QNZ/rl4eKFiyxGl2pYf+pJ0q4sxOfWft6FFkPKwHfNzDLd0H
	5j7XJYTbFc1T0nEAU6NDI5S+xLNo+KKKdHAUn00EcYqXjK0WMhdwVuyowmxOLJaB36RF0NPnp2M
	PrAHK8VKoZlzQUeLLCZGy+9K+tCwNxCsFeptBMR7KnJtCLh6tmr7YSzzGK8hwIKxBSFLdE4GT/Y
	OQib1xFBhLu0TcSL74NLEd5WwhRCezi1ekAUs7YWKAheJG9J1X0ozf3pcdxBag2bP+wCHMsaog/
	zKvscxeLyiWcFPdW0ltRMR7qZ8D4PYS5qz1lD8dUl55YgepVj4Tk7ULva//XSx6XY+1sqWYy7HP
	1urQMCPoXA1FYCgQl8V7uzCPFFtWWb/UvVleHPEwZxhr3TdgWDg7qgS9eEDy9lYn0s0y+IXTX9F
	eLHwxoOfJyZi/tLlUCGSzqp0TtCFRN8pxKMqKE8yi2m1vxqMzRahoAZFhXUX/xjalWRPT431ccT
	fmnaLTyYZc8c3hbZ1jGfVzBVRBhIFxlrAkHMclxYmxTKBc/
X-Received: by 2002:a05:6102:e12:b0:7a5:673f:7a2d with SMTP id ada2fe7eead31-7af1c79b7c0mr5593751137.6.1790601603688;
        Mon, 28 Sep 2026 06:20:03 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b08b6fdsm6952973241.4.2026.09.28.06.20.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986e0b83340so1894458241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAzs4zvaKCPw8n694BfYXhmZmtuUBxsvUdBFqSgtCEJZ1aSg686HDqU9+jkusR4inu+j3rRJY/YTmhn/ZlYIScfA==@vger.kernel.org
X-Received: by 2002:a05:6102:32c3:b0:7b5:b51:63ae with SMTP id
 ada2fe7eead31-7b50b51701fmr1113412137.26.1790601600212; Mon, 28 Sep 2026
 06:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924111856.622898-1-yaojiale02@163.com> <20260924111856.622898-3-yaojiale02@163.com>
In-Reply-To: <20260924111856.622898-3-yaojiale02@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:19:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
X-Gm-Features: AclHuK8pd1CvWEg6B7NRMA57BAKjQ57ly0DPVmCMPxitEFLoUXEoVyNz-CP3Fng
Message-ID: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Linus Walleij <linusw@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jiale,

On Thu, 24 Sept 2026 at 13:19, Jiale Yao <yaojiale02@163.com> wrote:
> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map and clear the output parameters on every error
> path.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -411,15 +411,21 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>         ret = rzn1_dt_node_to_map_one(pctldev, np, map, num_maps);
>         if (ret < 0)
> -               return ret;
> +               goto err_free_map;
>
>         for_each_child_of_node_scoped(np, child) {
>                 ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
>                 if (ret < 0)
> -                       return ret;
> +                       goto err_free_map;
>         }
>
>         return 0;
> +
> +err_free_map:
> +       pinctrl_utils_free_map(pctldev, *map, *num_maps);

Nice catch!

> +       *map = NULL;
> +       *num_maps = 0;

Is the resetting actually needed?
Only pinctrl-generic.c, pinctrl-sprd.c, and pinctrl-tegra-xusb.c seem
to do that.

> +       return ret;
>  }
>
>  static const struct pinctrl_ops rzn1_pctrl_ops = {

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
