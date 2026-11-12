Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492904;
	b=vzrzTL8GXeTpZXxDttpZElLIaBU5E2mJxz8NSo5K1c9w87ck8GoIfbrxA5/QxAg774dP
	 Ct575T6KzAGqBrMGd3wpbDBserTEDjqvlmrPQ7jh1s0AbXrxJcB2v4k7AKTN3Z7HXXW1K
	 TH1Uy81Gs69jHN/yJskW/Os3mka9wriERWzOLYx1c8gktgvtI155jYe4dtF7s57AYOH0j
	 G+JX92rQhWxGZjC1Hf64VleoBDNpQboXQQse0kijXP845VyvFKtJNb+F2b/Wk1MNmraFR
	 V+Khy30noWGtBI7Dv7kdRJpGh2Sv3K1kaChNVqWYmQ7+16O7N/xTdTctFHoxeGRC1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492904;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
	b=amszJD47mHvSjkfH8zoB4K6nUlGVk4gS/lF0i+zoRfB45EFDcFoxVNfbx28RoHsRI+zo
	 hg0nTgFs4q7+6O87HewTn8jft7extKzu+97dUMmzN4RDhHSi/qjKcQrOUgGmD9kPwaTpr
	 So5CfhOmAJ6oiewME1wQP/+buNhARmlr/GL2HBoNhGbkP1a1lc49pnkrbsFFPPWBLDmW6
	 oY5vRiLKTROax7fM5hBRqv//GH3x33XW5JvHBG/qD1p1CalA0DvYdLgCYNZzFor/8A23t
	 uDjgbPpAt/7FCiXqrgD0SX2YvdCkhyLJoK+gVVmbB9BLgtJgWg1elg/NHhGxhZbcaOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA460A3804
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 14:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AA460A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so1421843137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 06:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492903; x=1795097703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
        b=noBxbh08JaQCTMK8bL193Fw7AtliJ3bLh7bfdjemh2+euA7JFmt0jax+Bi01e2bNHv
         +u/IKFm51i8jJi73jcaw6NghmZTZDB1BADwkLdNt6rt80xS9JueuBn1P/bVTxP7kulen
         L7trftyFfEUG9wFtkGd0qstmrAVTAgMViUGaJ5/YNwp7jpAtmNp5vzsmw9kzRfeGsp/k
         rKqfvsIcf6P6RM2wWRY3snkI3g2GGCd8r+6C18BuSID7e03F85EgeiMj+QR3VFvtKt8+
         A9GeFeIMfMcZ7tcMyD41wEdHmq31NKZnp6P/tNGo1SSW3eWoVEN8kozC1O95XJRiZIw/
         YxZA==
X-Forwarded-Encrypted: i=1; AL+hErGSQujRpTrTFkIqy7PmepzrI3tFrFerEi5a6lgpKzdHn3Sa2zO9ukPgvcclAkEXc3hQJklOhZwxzEjqO4f+d38V0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/O9mSYs5AZ/LdAYf9Z4zfYEbxdtZ8QQ833+01fW0xkOb6lewCQ
	NjDnkp16E6PIi51H4fEImrOQa40co1NM1JYZudnJVsdy4Euwgi0wP3C7bxkkhXwqVU4=
X-Gm-Gg: AYBFou20bz1sdxEDl0yWtN3YwaUStv7O0e0zWOJmpabl8Nwuv8pFaiR4EoT0HX6HCQw
	SC9PjYkakXHe3BGquq6awIxYDG3o3emUmkuh6rWvnNFfziqaiSQ3ghz2kqMqzfrAhpMbTKpRsKb
	FtBg7qAZynYW5nGtDBRTBe1zNE1Lk7gmap7tLBT0T3PkC2UQd7wa9ENkAhytQb8nl0lX61GKAcW
	+slWKJ2SpxuLh0ixcjt7tl6FW+Gqk1EQH9GFdAiM10HBvZQai9r7qPLSsyjBuPL/URycBQDUjJb
	qiJJa/bQXmHNl/sIP4ik6ekq9fHS/7cQsZZr2YyYsA4yXQlyBJHlwN3sM2x7puvfonBtCzO5q/v
	6FjUfOF++r2iFTqxfayTjV7yDNWqTWjEOlNCMuliETd2ibNL0vh40JaDsAi8pLU4QkRCeNCNUVy
	fOJK8vG6V1XHFzwyY1TJAPJxtk88YAPKFJoUTy4OulFhS+4/kIr83yo6ioopdzFWlwHKRCV3zzT
	zd/LmSzNNVbhMn5dUagP14E1G8VKd3CvlC0QFSoCpREnDayrM5Ka+vmbpbqKP7yxLb148GMAmgZ
	/l3PoFf0addtVordoPt9mIeEc5eGZ3FhmLG8duR8ce/z/bbEWjkuy0Y791pX+xrJ4X0=
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr2133115137.4.1794492903621;
        Thu, 12 Nov 2026 06:15:03 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c494dd9f4sm761438241.7.2026.11.12.06.15.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:15:01 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-992f6d8cb51so1036530241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 06:15:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGrWzxppjdIMBI8+uZD7PMjQ1d5BqtxKVsw7gyen2WBGvtkHbyPJlkg/SMpl4zv/1D4lKUKkMSnzkJXrkwzuWEBnQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5798:b0:7c3:881f:b620 with SMTP id
 ada2fe7eead31-7d5060e293emr2040092137.21.1794492899954; Thu, 12 Nov 2026
 06:14:59 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:14:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
X-Gm-Features: AclHuK_i81THT_hnDNfFBzoyAYqo67SKua85inNQRuBh9I9Xk4b1lG_6SVOc53s
Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] pmdomain: renesas: r8a78000: Add SCMI maps for VIO
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add SCMI maps for the VIO domain to map the VSP and FCPV power domains
> and module controls.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
