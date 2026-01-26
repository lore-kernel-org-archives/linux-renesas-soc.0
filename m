Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B7D340298
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441654; cv=none; b=Dox/4XVRSY9ERuv5/dZFQTOaFyu2zpnN9sg+sep3C1pKqzBymA75z8ywgK3A4HLTBhPAIDHGiZmrD7pO36I3y1Q40RN7UM0gkeLnJrj1/OmlSDWY8SjSqok/QA+G2Mj7WYYuaXuSS0SBBiR9bJjXzriNuVTsR11BqPlrswhugc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441654; c=relaxed/simple;
	bh=nTZYFAn4zz6jIv7uFk83h22IU8Xvf0ATPw3U8GxauAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YD0WSNqpm3jumdfXctCwRFldaVhMypoXXDy4Nnv7lO32fh4pSedej6YTsIVEiaQ+SX+CKHLUfOVtRYQvNJue2jr1VHr/Qkbrc5N4jzTon6TgF4l6cxN5iSHHzy5Lyn7NQsirFXjlVbKh2epcbfWhIlYx9f+57fnt8sIbvb2Nw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c69ffb226eso672191685a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441651; x=1770046451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqPSDhihrPdf4Khj2S8qKHDF644mb07LvFd5WqEIjGc=;
        b=bh4rqqu1G516st5kF/ROUSyIiqFPauFXQ6zEuMtOfCXoFLn0XzQ/YPvMrtmAgcKoXb
         EpM/Za9j2131sbkb6mwiTQUStc7eGgDIeWeydaz+G1w2EvaL9ywXfF2CHk2F+Imacknm
         3hqehZvWKIG8iBIXlv6gppD+VQrSyuU/8EtR+UaHRRuZLNnyxf5vl0AnUOYaK0S3F6u7
         2src5F9bmlEQ+snqmrAPzfq+rEmhWhlWUhS+YF+c6LJQBm3w+3BZCL/xSAPQTg7S4nNp
         n+n25sU91Y3zT4ZmMa9eTxosuZ4uz2wcljeX8ov7ius/CO2vi2pZyjlxB/HDSzGs+D0w
         MeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+rMKqk8Jmx57ovZPr0yOFG7KtVxHXly3wL8lWxh6NcGF7xsUudiA3nTzN1i8BGGCsPmy6XWuaUQi+EQcmYgOlig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO8ttINW+U9ePDonHI8Xxic3oMDHV4JH/S3/xVW9BiZTbjkSFE
	4Qjbv/p1TtGkt8cljyWceMgEgQEh3rEjlyEbf5yY054LSbAoBB9v3Paf0j4oBo/u
X-Gm-Gg: AZuq6aLwEOszWmekW8hDL9NwHaXV8LVKnjdeWuCAp/2iHHJVxk/z5VTfyvaB2KDvcIP
	EGa8ys3GPE9dJxMNM4oBn54zCmfHzR+ywTCgW4kXTCfmC23nAM5AvxsNXH/k1uc5JQmA3Az8Hji
	WUiudKNI7xG/x47Qw8YOh5EDILQCM840/gDki/6HgLCSzk+SndpcnHwQeDdUKBsE2A8+1p02M2N
	gi+uZOmv5TVw+hZQs57jbt6HagZkxuAEUfoGCjGgFnt5bpq7DlR0KKmuod/gxb1A+1cnCu5yzkU
	IwP20rcCmbcnsaY5Zrt6WD2KE4ABEi1krDPJbGS50wEgOZfAwnnVQr92UN2FGaNNpJDEQ/YqocT
	Ds/JSu4oHAK/EGfkvvZSiLZXKUXh+ToH49Qh0tTzRvN4nJe1IEY9g5jy02zFqqMTML4uNsHSkwD
	cin20K/36z0UBzWjI7B+e1GJnXmRm1oYK/X+RzyYmVLp6Ym4BdftjF
X-Received: by 2002:a05:620a:3f97:b0:8c5:2e83:d016 with SMTP id af79cd13be357-8c6f964844fmr579799985a.72.1769441651185;
        Mon, 26 Jan 2026 07:34:11 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e383a62esm1028315485a.27.2026.01.26.07.34.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:34:11 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c538d17816so634253085a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:34:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdTi0xd/+MgNULvI9y9YHdRnJ88Qb2DZx90Wulr26fFEGTM+h1jJ8waUwUb7peE+Yogmk9um1upY/SKpSCzsBS1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:e11:b0:5d5:f544:a88e with SMTP id
 ada2fe7eead31-5f5764f908amr1370657137.35.1769441289411; Mon, 26 Jan 2026
 07:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:27:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
X-Gm-Features: AZwV_QiV_Vg-viwqsMsGeXuhl8oqSRausfwmVq5_XCglJk6EVp0gGv8dhCY1AvE
Message-ID: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g056: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The r9a09g056_mod_clks array is sorted by CPG_CLKON register number and
> bit position. Move the RSPI 0/1/2 module clock entries to their correct
> position to restore the array sort order.
>
> Fixes: 1f76689d1715 ("clk: renesas: r9a09g056: Add entries for RSCIs")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
