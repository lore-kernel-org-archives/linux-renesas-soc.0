Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDE486623
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407297; cv=none; b=LoTEpDvAJCM8df2nkHf0hSFJHaV4xJQj0CO19BRWhgfLH/R7veQkOeLH9kk9HPn3NYUojxbad5K7HLvXGzzSWkKOZSSInI2QrQoyq4nbjYlSakLmK1xbLHE2wWRIWX+JbQMmdMwRmw0DV1pd5KGkCPDFPJlWKmMW5Kienjaj7OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407297; c=relaxed/simple;
	bh=Vsfrgq4Z1iO5Wgf2nTiGn/7pth86QSJP/A56JZdeAO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ys57NsfbF0ZGyLPcbswbfK/MNuFROPrrjpnf1g+zl2xJ74meoaKQg3TlIe4WAYPh+6gU910PrRuKUJj5MaRwBJhaWkA3Fgp2Kadr0QJh9jrqAIdW0NhH6tWMRtvO7OdpnbmMD8qUCSvgqGhNEE03qhy0/wyBuuIa46C8GABx8l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d9197so2036228e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 10:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407294; x=1790012094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0NUX54nJDMCbpqD/MoUkH89fRfTiAlUe06ZP87dx3t8=;
        b=FDuS2rVRepOcpnPVHkOA7rPvKcewkNZPlX+7pz76gQKph+z0GoAqub2GOJXsH7u0wK
         jg6dBJv/C85v7q29g+DJip0/5V5ulCG3enaAAN0bD7UJmZmnfTKdoFOZu/NYFagOaWgB
         Ft0vK48NxSX2pRgeW5AP237sjlJaaeZkfw9476+iDqwYBmIcmqibPhXTEPwqAbd8zb2r
         uKTYRqBU7Vb3c3mfW4YMSKh/Ytkj1IxOnDlmDkb24ZhRLiTWp1aKH8ajjY2WM5B2aiED
         41br4eSq6Tn3/DMZdeTams/XB+LYjAoEk9GGr9vCBFgNWn4C79DnU9MSF+UJqa7nsuaY
         MWMg==
X-Forwarded-Encrypted: i=1; AKwUvBwvxsoFDIcGLT0vrc8fJdHEmGraA4AQbvVDFsB37sqMbzlzZ88SVxD2QbG4+px6dx5VBiZ//bFmfrGcm6HkerL9hg==@vger.kernel.org
X-Gm-Message-State: AFuF++nTM4wCJ1gXisV+55JCJS02OgaypE5Nub75nFr0j7VmDjeri0nL
	ct7v3KbE6cjZUBTKfX38fxfQKtFR4GVhhyNX/AxpL8bVaG8vwB4qoAvFkZZ+EXPt
X-Gm-Gg: AYBFou2rFC1E0tB5xypTUxhaIw9dJF4GiAxqPVzq68TGk61SfwtPZK6HFJ4+LcG70NW
	tmPZnorMWlBYvnKfNrqgeQnrgKD38eHOlKFqWZeqWJSisCyzt3CVBVkLK8fd0Omcc0lkZUStU+d
	rS8wZukY9vbVjoOiqGItkDkeaJbx8Ehqb0HVxCwqM9CgVV57yxHojn9PjATN4kNipmxre5W0I/c
	e4Xlz+zNqSPuUYXOlOSXO0IghDEZO53K3vBQjA0P4Wl5/2YYST3LsAM6xujcO2F3hR+g3XyxSKL
	To0wHlN9ZzSnkURl6REXpuFuPK1dEP91/dFx82+7ybElhzJ+UMsVG6rWUvNtO8oqBDUgrVPq/Hg
	ztJ8YVkrt+LnXlN1AczYIYWdioVszgco6vwphqeDKXVuZUu3/IXOL5vM6YMilUuj2yxBdgLYbGi
	q2p9AhzGpwaVEkan1JRAnwLSXm8JFp9tV4Zu6qVffgjzva51CLIPwgNMDxPu3ZCkjGING5J1ewo
	+6b0Xg2UyE2bDWy3vL4OtkOaKPac9zG8kKEEA==
X-Received: by 2002:a05:6122:32d0:b0:5c9:18b1:b7ff with SMTP id 71dfb90a1353d-5c981d6e55dmr2290903e0c.7.1789407294602;
        Mon, 14 Sep 2026 10:34:54 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c847122e2dsm13052357e0c.14.2026.09.14.10.34.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:34:54 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-98296941f1fso1397995241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 10:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAwuDHmq33RcfTay9IBx4S88dUXhC4IWKskt5G+GizraZ62c8zPqc4loE/HD4ZKvaBbC1UP8vomdHWX0+wiriX5A==@vger.kernel.org
X-Received: by 2002:a05:6102:149c:b0:790:cba0:960 with SMTP id
 ada2fe7eead31-79b5acb355emr2241619137.10.1789407293829; Mon, 14 Sep 2026
 10:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <3ee335429dbf7c2d105d03e184d8f74872b680f0.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ee335429dbf7c2d105d03e184d8f74872b680f0.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:34:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqRynsmD2nPqmZa2Exqxu735U0OD5FCdOszg6cgWKAvA@mail.gmail.com>
X-Gm-Features: AcwNN1WoxHDmzn2F97DUjx3relfUn6leVozV88qE-5Mopf8vJX_28JLL2_fcd10
Message-ID: <CAMuHMdVqRynsmD2nPqmZa2Exqxu735U0OD5FCdOszg6cgWKAvA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: renesas: r9a09g047: Add USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
> and 1x channel with host interface.
>
> Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
> in R9A09G047 SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
