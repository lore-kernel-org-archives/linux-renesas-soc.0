Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED645A2BC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 07:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751992; cv=none; b=AvPKjWeTigOB+2YLT9Ku5XAPqqYqA7fMMACtDbHrK7MU4E22buVLUjQYcWM/DL9ozZb20Ts+rdIYAHFJLV3QnpBNsT+tNrX4KUsahQi0lCV6CHjXsUJkiDvmcXqBSZLX8MF7pGc87wgjIPwCRxzITBZdr0jO4hFZXRsCnTVaFF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751992; c=relaxed/simple;
	bh=wch8nfNOZ3yz6W478LNk2PKlIPZ2op/sL1/5uWaDjYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnWn5zA8oYgEMweVi42shkRRNQjY7dGNsZAefgAvr6V5iVnaa2fwrdHKE2hieOfo0IQvQl0l8teZuIXHQrzRYLQJeRE/bUieZf5DxHj+9am+Tlbws8wYB8NxzNwba75gk+3lJ7zR967OXTCUIMDC21CPp2YjL8ONgbONa3fJ7/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7b42996ae72so742510137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 00:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751986; x=1791356786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XVZnJOotlaaUATBE8LN5Zb2VdzLY7iJmIqLqFopSb08=;
        b=AUAbvnW2yX4vmHQg5JfdoUv3XCIyDuBwdIjIzKqqQ0GTQUo7oqnMxla/WOxv4SN9K0
         PT25TCkHXkUVIJLiw1FD1VvZ0cf7aeuaJNNpNGne0DXSMCEmXJQHD7F47QX7E6owqu1m
         +ifTNO5aNzCbdPn9N7BHrzSTFFCLw45FQ1Izz9G0JhQYT2CyKPggI3FG7dKko2KQNucC
         ApBaF+wJ7qvXSDUCIbGNDFnUNpijHlTlqpX3LSzn2s1OIjAA6b7Js2tUiKoYHD3IjH/0
         x+sACS2vW57i1Bc2WYZSy7tptSxJjq0co9wpzkbWWvbfmiWQARP55yjTK/f46iSglghv
         fz4w==
X-Forwarded-Encrypted: i=1; AKwUvBz36rh/8Kdas9GNsZ6T+1HO8Goe0zIyszRNIVmB7uR/r+iZvSrzXqV8CDzp0skp4djsinwnp35Nk9xyW1ZA6cTgkg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKIP88QrNv6tFwWzPtT9btwCORqK3X+b8q7HfzGd16Ctu5A0ybB
	rnKPU2ZEVu12SSnD2yeJtcQqkX/dgjtEp0Ystk6GUEY5VaBRJk+izGZrKQrO8aLW
X-Gm-Gg: AYBFou1gOuzVmrCRQgKXQME8WKzN8TnsImwJlOjQCKLWj3c1CfWaCINBPQaNP3+ztGf
	ZeKWvLPkIlDwk8V4uG95J4MXR6U9CxAdfS0OaZ7aZmX4ljYVigrvGrjEd8gwCSZ6p44HWxufncv
	r+5WWiGt/V1itqZx2+usaSaVCP2CuA8E1QWsI98o+7xOSmg8A5qpKHYcDF5iBbok/MsssO2Z3SN
	WET6BrT6RFCvyCyMzqrGhlm2iBGBmZUdgHlRE36Om/D5G0TuJzLmPjrO5I9iXuYljLg8hA0kDlg
	5jH/MzXgiC4Wui9Hxu4FP4MPGCPzi9+xFMj1usCa8sRiXfLBG7oqQdlR349un1noIplkE3/nTfv
	WWls2t4KSLQ/Cl+gGZCTNOICuAvoMbiciNrSTDY8z5IND2cqY/q11ieEIhtP5vJq/yk9Fuv+Tc2
	a5dMPYGewgT/ALHLU8htJwVwBtHUo+AGBy56uaCdgpZcWUr9eZrzufGeUNg+gl6AP8d82sFtEUe
	/Vt+ge8WJ8kJOKQd8am12jxkGOuHExAJk0TyRc=
X-Received: by 2002:a05:6102:c09:b0:7b9:fd44:58c4 with SMTP id ada2fe7eead31-7be729b9800mr46842137.16.1790751986453;
        Wed, 30 Sep 2026 00:06:26 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988d93d1defsm716139241.3.2026.09.30.00.06.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:06:25 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-988cc1391ceso319851241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 00:06:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz7vQiUPWf8wUnM3QuUAlguLgOkjhLf1jShtzIUUvqwB7JnzvlRxdnhQ+hs2Bvdvezw6S7uBo5jfFD5Sob8KdMCDg==@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:7a7:3485:33ea with SMTP id
 ada2fe7eead31-7be72ca2a93mr42702137.19.1790751984641; Wed, 30 Sep 2026
 00:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <20260929-rsk7203-properties-v3-4-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-4-02f84aeb8e47@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Sep 2026 09:06:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwVWhPhn=vH-FbDX41Hnshg7V6S+pg8kreOHpTgRWeHA@mail.gmail.com>
X-Gm-Features: AclHuK9VR6aoLpU0Amx9qCakt-f_1gjDC5BvwgyzYKux3uxlHlNiLggGev2T8tA
Message-ID: <CAMuHMdXwVWhPhn=vH-FbDX41Hnshg7V6S+pg8kreOHpTgRWeHA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] pinctrl: renesas: gpio: support software nodes for
 function GPIOs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 06:58, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> This patch extends the sh-pfc GPIO driver to support software-node-based
> configuration for the secondary 'function' GPIO chip.
>
> While the primary GPIO chip typically uses the firmware node attached to
> the parent platform device, the secondary chip should target a specific
> child node to avoid ambiguity when defining GPIO hogs or properties.
>
> Update gpio_function_setup() to look for a child node named 'functions',
> but only when the parent is a software node. This ensures the behavior
> is restricted to legacy platforms being migrated to software nodes.
>
> Assisted-by: LLM
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/pinctrl/renesas/gpio.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
> index 4e59dadb7364..b49a3e14da91 100644
> --- a/drivers/pinctrl/renesas/gpio.c
> +++ b/drivers/pinctrl/renesas/gpio.c
> @@ -271,18 +271,40 @@ static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
>         return ret;
>  }
>
> +static void sh_pfc_fwnode_put(void *data)
> +{
> +       fwnode_handle_put(data);
> +}
> +
>  static int gpio_function_setup(struct sh_pfc_chip *chip)
>  {

As these function are only used on SH:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
