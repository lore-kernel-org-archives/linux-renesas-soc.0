Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D5431A44
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976883; cv=none; b=FYQwsAMs/Vn2EIs83G2+94trvbBfxe5WOXds9MPMx5kruzmM9ZK/8LfsKV0zaNspler6vrRxUeeDMETPXp67lcOSwG4rdicakBoMK6PD7+HxCQi3NeZ0c04I36AC6v+e69h7+dT/ZKnMYUvtHcnasf/LiZDnBilWl0n/IK0kBrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976883; c=relaxed/simple;
	bh=nRr2NwONb5MDiY74TwbEFnamWl7CEbEpARCJXKG89CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcPQeew+bq7rA6/M/ZcI10N/lkUZEzfEolq/YiZAsTEvbrGsfF4I8Y1Wwe3IGLM56V88wKuyGoikCclCT2DIerPZX6sv2PrLOrFN4kMOjXfyUk3D2cPrEnhpSNqUIqy05xTaaNhFlFrYeTJESMr5wwhpHfD8LERdQMQXQ15rEA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7aa0603e450so54554137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 00:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976881; x=1790581681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FDUPsKvRHny4pMpTXrqtNbtll59mp87r5rbb0L/oblw=;
        b=ZqtfibvYIbNvP93RYzhk5nwByGg5RS292z/k/KP+y19C9YN/isaxe5potcHy/zexSg
         zXI7Yju3/DHZZWYc2RmEvRa4Ez3CH5EoHxl2xSoTBzo/epLBkfTbNycAWODWodyc+Ga5
         bUc0OozPXZacd3AQxvak092cb3RiAzfU3Xg4MfJPzSpP9WX2Nzfr6SBt89IxPZBTYh6F
         ps9Mede+mR59ZEewpDy2UAfsfPlz2sSOT8Y/fMo80acZur4jKYbE87gDdIqEoC3NG7dh
         UJeBWpPuVOTgVaskIs4nWLW86T/Io+fDrix8WXeU5yViwtbJXnMdwNZ+x75RAO/WTkjf
         krkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3ZzySxDQMj0PSWGmB/OwevQ1w7fbMGhG0BP3NLky5u+9GeGbx5gI2/n6krImJ6eWkqAoeFvT+ngdFPmPAJhx4sQ==@vger.kernel.org
X-Gm-Message-State: AFuF++llBioMuzHkbR5Kt3LFokxfAdp6bkrxzdPINgvqfE46dMBY/Uy4
	dThkAA2CIuVQBvZSBHNWDeYpmqLohA8nEKeySZAAbZ62XCNSUbTGueNsRUloFy4Q
X-Gm-Gg: AYBFou2dqy5C+D/2KUETUl6PILOciOf6X4Ebm5V4OVXMqpxwKfTJpxdYCW8WObAXcxc
	KFXm/EeNHP8H6rxbrsgPLYwl24uqi5pnBcGgO/nLVRAXi1zroHYi1Wv6v1PDRTVN2C6sxS02+pd
	ijhsuhtJiDo79Y6HhzBXhYkSn7F9KavJu0WfkOtIejCFeFMCdbULtde+8dm6EeDqD+dnUCU/Owm
	/AukypWc+8B5AQU7JqSIDxf98RophrnhtrT8L9tO62g2+5A6eQAwU8TaiyUrFvwYdLgQlvqX4qg
	hqD1Odi6/aMk2fJTA4JKO95b24ww3diAw4KP1BNi0IV0GD5aAQN5SpJcMkOTVJdYCmqRLwo0l+c
	5VhN86nFklI0kHevS9m9VTbTaDErLQkd7cpLuD8MIUVa+FtTzjnppMnt+Px+CLxUB1FwBdmewlE
	W+MjW4Uh3caZJoF5cRcRKT53+uljMsvWpgCbFw2SGadWagP7Pfq5eU8MIN5vyEL3zqSvn3AAxk2
	sCXC2ecu3bDjX79oHykrGbsCTvY4Gu/Pj4fIw==
X-Received: by 2002:a05:6102:3e96:b0:7a6:cd3d:49ad with SMTP id ada2fe7eead31-7a6cd3d506amr2162494137.7.1789976881359;
        Mon, 21 Sep 2026 00:48:01 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-984d55d25b5sm7459602241.8.2026.09.21.00.48.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:48:01 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-98296941f1fso1283627241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 00:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLYvbl4duP5sIGskKlWALLvu/PVCankIu45yszcWN2D0cx4iZyoUGlpLZWiCGskaJj956A+bJqd3rdMHQAJjIqZg==@vger.kernel.org
X-Received: by 2002:a05:6102:83d5:b0:7aa:17ba:3dfa with SMTP id
 ada2fe7eead31-7aa17ba42bbmr32910137.31.1789976483444; Mon, 21 Sep 2026
 00:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
X-Gm-Features: AcwNN1UjZbDPnIaj-fYRvcBoX7YE3K7C7k2z9bWrLFQVkND6DSGXX-e-oumCCsA
Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
Subject: Re: [PATCH DNI v2 00/11] media: rcar-fcp, vsp1: Enable on R-Car X5H
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

Hi Paul,

On Fri, 18 Sept 2026 at 19:07, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3" branch [0]. A
> branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
> VSPI:
> 145 tests: 138 passed, 0 failed, 7 skipped
> VSPB:
> 115 tests: 104 passed, 0 failed, 11 skipped
> VSPD (a):
> 114 tests: 99 passed, 0 failed, 15 skipped
>
> VSPD (b) hangs on the tests, so that needs some investigation.
>
> The first couple patches add clocks that are used by the FCP and VSP,
> but as the upstream X5H CPG driver is barebones at the moment and we
> don't yet ensure that the parents are enabled, these are marked as DNI
> for the moment.

The DTS patches use DNI definitions of clocks, so they should be DNI, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
