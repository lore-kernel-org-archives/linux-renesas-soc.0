Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686AE3F65EA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163720; cv=none; b=IJ+cBa/0ZjoPe2eXAyDdAicWEWCuyPCmsAEJjnLAKF6gOmELvP6QXtgsdD2IJtg6TkuTxHWPx/wmYgX2/69ovCrOl+ifrDR9Hw1sKyMqloia76esz8o3533I3RPmVbn5kXCAMnWp1lsO8dVgFlvG4cXZwIdLkrfQxk7V3lYqhm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163720; c=relaxed/simple;
	bh=88RWzbn/+jTvfVn0/HFOlPVPnVyg9BLcXVLlqTv8hP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orfKaBWw884arRxwiUYo1BIpKrks+Wy8s+PCk+9OmajxQC1IE0pDOknKxHn87zJdQVSmFbL+jBbYlc1fML7zAuNoPkmLgq6y3GsDC1Mb3nZjHkyaO3rS3SDz/7tGgQYX4rSzvTUw3wBZLtFmQxnwnNABgtm2a/SucdXJNTrP+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed1so428390241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163708; x=1790768508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zh2KYVrSMhdvS8iHXuKJD1cdXsjz7/TJAFEy3igYvuU=;
        b=ijqFcMdOoI0TieFvLEMUDXhlCZYJw17iQqcQveyBM61eUUi/V0t35ZDQDMbqsOmF1d
         Kq3f92xIw8kjeWRHixsFUKaJM+VnXNwxF9l7m3C4z+21JHy72JVGR8h6dbfGbNHz1u6H
         E2Ixzhej8TzWrV/iAy43JbXbyedyG9smr4jw9Q0ta1HZ7h4x0GFyWm0pW5MptRD8tQKz
         4YaUdA0K/LYZL/CK125yXWo2E+Yq1vHJWMPheGsmJNYXveEwkjwoVB3dJwySOf7U1A7C
         wFismJAVXgmmtA7NCQD/lwQYc4hDFMVhBkhNevin9xjpcAQ83qzSaWelxKm2NuWZ2L1D
         vjWw==
X-Forwarded-Encrypted: i=1; AKwUvBxGK9KoWEZ7sQyMwSL06WYgFnDfCDpIFIvxht3Ekty0eZoKFjdx6ibK2jbQINf1XMEx5kWDgfEkZ2PHXT1xWQ2Kpw==@vger.kernel.org
X-Gm-Message-State: AFuF++l8mmae+QPxD6eUiZ4ipMFSSKzBRBCtF3iHQ972C4aDGJ6V690y
	SfPvsMylvax/DKt4aqOYbAHKl0o4neRYyU47sqUGAAL13V8J52lV2GWhkzKZtKPWRdM=
X-Gm-Gg: AYBFou2+wutPhsHBFP6l08FeZdoC1DkXNBAUPLNsk8vhAUlUVRLHws5qmCoGQH7VJIu
	KOWk+66mDM3ZxVf7Vt0CGzZ1qQc0AhhcCWC+BH7hMlyiqG0VGqe8bnW0sFHv6uBUkXuZAwM9dDH
	PvSOhVJVX3uUyIk/Tt1loScB1xSvAcluH4igaQn9+QZNV6cajFrfAzzKas4YUQx1rRtnrgN/GvY
	u+F85FXqXqz9bAzZZz6NMLqT4Lq2KySblOu8VxwudVJCWX57To9X7Zl+OAqkmlsWgpZDL3xjApG
	DPwtDZZCW1RhE8OmMDlzxE0rAfbQMbXUK01k7IWOnhjfUjB0DdDQkd5oP2JeiQUkc88pvDhidqH
	R8GYTQgAVq1D/NEvvKVHyf3vtKWA/vqAl4ivisyK/mmcdx1k8zOAP1xVSXakxd3nRjkxGkM5KTX
	vZexmJ2MHgPhlPHlE+DraGNB23MvaFl4IGRau0DjeHVZJYf06W6A75cyWHP2Z3VKTOtq0kZxQnF
	WgMoWfgKtcZp9YEPwOEimWRf+HmOVisK1TgMaTMNSafUuk=
X-Received: by 2002:a05:6102:1620:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7ac1b000a19mr2209757137.7.1790163707913;
        Wed, 23 Sep 2026 04:41:47 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566bdccsm3253081137.4.2026.09.23.04.41.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:41:47 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7d8so460325137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:41:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2AewZW3AguyDyEolXvs2IaE8NFvHki+C1C8iBnSB06FMqvhlKl1ilKsL2djC9yPHi0+y3e6exl8f3g4YGv3H/Kg==@vger.kernel.org
X-Received: by 2002:a05:6102:4b04:b0:7a8:46fb:eb3e with SMTP id
 ada2fe7eead31-7ac1e45b0aamr2120265137.36.1790163707075; Wed, 23 Sep 2026
 04:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-5-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-5-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:41:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJxPOraiFRSUTJ_9J5Ft5TwpBVJhMHOUa2Vs9BywdvWg@mail.gmail.com>
X-Gm-Features: AclHuK8SjZ9c_4ckHlrUMygRuUW85Xhsufq5Fr9074LRPmosifEbxSZ8cLmLsxE
Message-ID: <CAMuHMdVJxPOraiFRSUTJ_9J5Ft5TwpBVJhMHOUa2Vs9BywdvWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] soc: renesas: Enable SYSC driver for r8a774a3
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Select SYSC_R8A774A3 config option if ARCH_R8A774A3 is enabled
> so that System Controller driver is enabled on Renesas RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
