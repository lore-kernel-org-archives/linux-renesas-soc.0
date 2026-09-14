Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D806735B65D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404795; cv=none; b=aoaxwjVdvBJ5WZYiXNNB5srkL+UYpbSkuVAaL5PAOR7gJ2N0byhv42Ek5SJD0ICBnHNdtTmCpQJIWb46+m1DvS8NZbBN6dNwEGoZ2/2fjLgAAHeDkLuKVHXgtHyzEkqF+5vN5RBIVZbA+6rTWBpGThnIzOS8PqBrBdTwc0R20bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404795; c=relaxed/simple;
	bh=MHRL5BbXVh3Yy4fuiiJxCc1O6s3ax5adZDowYCUDKEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXMYzBExbxM/0R/NOu/7mq/UAPLY1OqMALiiJCZ6iE0MYWm5EW3HTP6s57CEOabvDGSuXxRezPK1QDO4sYEn82p6KgHUAbTDXugPwz9LitqpQpPg11tOQhIHcZknzmo2BFK4enz32HgvCYfyMC1oS+Hq/hhmYAF7lZSs1ddnNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so619379e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404793; x=1790009593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NfxIiMuQDiqgQaAeq2yHqZdFbQc/UNrumMADff4NP9I=;
        b=NsYI++E5sMNtTAYvt6TgBTjk08ldHBi37aK+RxqLwGVw1dJgR76H6pJnJQVm8d6DUu
         bgEamY0KGm6n9e1y5NW/DAGPg/V2SgsRrCiTvGQ9etRiqeGJ6xvkr65EI/LgBIQ1Rdqp
         gTYW3U6b0sTczn+PiSa3HhhERqI0ft7c1S6Ea3lK1Aml1YrC6p/enN7OOqZSTPspEB05
         x9H1mQUSr4XUjIB/c4wq4d6M/Jglic6XenWa1n2AvlxFCGys0hhZGr9QjazSNDsOwkR+
         mLZMGwKV6+uP18p0F+lW9tjmXqV+LX896CvoUdk5mQpMZBMnj9lGegl0ry2ME6Oeem+Z
         SaeA==
X-Forwarded-Encrypted: i=1; AKwUvBzziGhQWKaUHmM58jeHfukwexzUD3KknT3qLqh+P8Pn4W3Jun2AFONawlUAjiaO2nvXt32GeAx4trsoDR98vTzOeQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mg/CL92rloo223NDCi/lf6ONiP/mm6guBteNKSuGiYmA7+P+2u
	eDpvXqcaESw/zNx+IjpG0hXoY56qzznJYwTfFDYYRIAZMHhAZnxLTv/bAHwNi25Y
X-Gm-Gg: AYBFou1rrKA2kRAsohd1u+A0DIQmKcQtFJMvjdQtQgP5B+gncWnseutLWaXba+2teFb
	8xC41zTt5MVc0E8jpsz1ZJQnUONKaBK5qleHuoLIc+c/mPG+MnXFBMPbcVAVFI3K9PppylK/63p
	xgyZ1nagXJxvMdaPKeTzQCBJV2M2NL8d9VEk2E3jRMr5CWuj/6+PWKJiuFotUVomjzkPEbcGcFj
	1bmVxhGImIRBkzwAfxns2pwqPfb5dCzqhxWmNgbZ/2cqUR/L2IwY9J1YpyZWzVCWooL52lLPFsP
	TZNfLVd/Vsw64rXQlL979reW2WWQnODHJoQGXWfqw2PMeycGp8mAqy5yqFVTBhTT9gJ+M+HsSXR
	GPg0jPhIE0VMz46lOyhqk2UPGEYBnR+uJfYN+HwA6sfQbFFX5nZE99VfoRc0/DJzL4Lf4k2vriE
	XmekcKZsQDCVp4tvFmf1fKngf5D7TNBj8fM1N6SHXwoiaJYUk2R9k0Z2ypx8k3Omdxp3sOYdI8d
	5yO+4ikTfwcobZUdEM9hasjESkRCPknKHNN
X-Received: by 2002:a05:6122:3382:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5c9820c3842mr5082084e0c.5.1789404792519;
        Mon, 14 Sep 2026 09:53:12 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9a297edsm12524426241.0.2026.09.14.09.53.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:53:12 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059f9so969182e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3h3KDzQpJBx5Vydx+vWUOq59j4UqUeWI/bD2fY3+rbbPBEu61H7JFbL4cs9gBeFYmVPfssEYmTzFJHCngnLfO/g==@vger.kernel.org
X-Received: by 2002:a05:6122:d21:b0:5c8:2dc9:f8d2 with SMTP id
 71dfb90a1353d-5c981898b18mr4839334e0c.0.1789404791699; Mon, 14 Sep 2026
 09:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:52:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8oHnOZtaZEhT6ARw4jv8E8TCW1oj3=-st=H5DGYP0Qg@mail.gmail.com>
X-Gm-Features: AcwNN1VTw_3ezXn2Sdyot4rz-bUBb_2ZP2fpOPg3aubUSTj19P58---m_IGsxkg
Message-ID: <CAMuHMdW8oHnOZtaZEhT6ARw4jv8E8TCW1oj3=-st=H5DGYP0Qg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] pinctrl: renesas: rzt2h: reuse helpers
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The PMCm peripheral-mode test, the PINm input read, the PMm write, and
> the PMm read are open-coded in several places.
>
> Reuse the already existing helpers.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * move the PFC read helper reusal to a later patch
>
> V2:
>  * pick up Geert's Reviewed-by

Thanks, will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
