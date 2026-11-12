Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491045;
	b=t6rjkIJ0AbkhFJxxYDXxo2uRDAne4PN6gCFFeQFsHqAoaRz+jO6tpf9F2x6J2iK6XJlj
	 zX2cMPDfiuXT/OtuFG6APOwFiTIj9U2CVXdR70SIieo4fAoBRcodlJQw5Wz9SSjsecIXE
	 njvgdIazGiLXsK5Fo89h3uuljKy7utKMwoqPEYYciT3cO95Trxwv3tnXmCxSk/bEuwCu8
	 LEoPamWROy81ENN6WCfMlA/XLS0O2q1/ztAmVOOTIwDv3aQ1ZRj1op/a/xlvNFPz6fSl5
	 WMN3jWp0I/LdWL34IaHI3PV3X+mDc+DBc3w3uHjBR/GHcH0Bi9xvcBhHkeDRIrJLYfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491045;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
	b=mB+z6Ds5qvpnY/L36CK6RpHPHUQj3aAqz37Hj/YXvr8zUXZT1IN0Nv2tU20xSB61ykRp
	 RuKtgx0V4scjJbQz7bBlR/WcpGcbGnB6mvAVAGbiNfCPRhzYvc5FI0inVtqi50JWvXrUA
	 aboHrSdZGLfShcO7mPaCU804i1DbLsJeVPwG76X0gGnQeNL68M8e8gtp9TuUSwvv49xRv
	 PQ8zIrYlse3v5ciuX7OMTmy6qr7Pkka9BCCeQ3yUeuPeUGqNuygFqK97MEzUML6lQyDFV
	 PD7B1zBhu5ZvWhMSlXQb3fvK9pqOslSA0qzRh9YMF38FZmtY8TOgmbl6IuzAk+5RXzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1230606A330
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 13:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1230606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so5732276a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 05:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491043; x=1795095843;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
        b=jtWLDuJpz+bnd3TM0JaBEDAXUMT6cZhjtnRUNqq2G4QLdQhwVQDOkJQzb0DbBWdTYX
         6LwITzIGnvcGK3HRz/iYg2aC9YPXkpcePuJMRl+1WJd7O7oHG30RPOw+aLJXfISmzn0R
         EyjhDHIy93akx23mbbyaXeCTzJ/CkdJQE7Cf+OmkhQEz0i9jq6zrMNKVgbw+E6ys6xvt
         Yfm4qQlddVCiaMDJDEsg35B0kSdfAG83rGZ+lKMQhreRI9layXZROmjWxfQdbwXvmVe/
         /DZPRfR+qfpFuH1gmDrAgaNma/Pt6OxcpLSjAtXA0cGgvniiqQ9HpdxQ9v69XAtYJ2bX
         YA7w==
X-Forwarded-Encrypted: i=1; AL+hErEd04qO/TXTEB5d8popEZDjynBuQh/NB2OoRNp7Mao+Rz2POK5KivMYKgv69iVDxBd0N9vg978BZbBfqRPpuvlqxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CP6JZrmFOSTNNEGBgfWpHHSLZQKB7sU7Bl7Cr8BCMyIzUCe3Y
	bcT5zOZsANNsfFMNA96ciBBTJQ453XUgOUPF5viVVaUoUR1lhMCYcgfadodhqtwzT9M=
X-Gm-Gg: AYBFou3GL6oS3KPXy1xkGTcLsfhxEz+Ik3kCDy0LUMOzQWfyFBm+J826CgiAB/kTpoP
	IwnR6Kxn1AFwm7iM8K8AMS1Stzc9KPnEWxVWxZ5Fx867OzJZx993SUT2B75fmllLUqzQnfSR+yh
	Pm/wOxBHKTQE0QCzmOIcvZM5IJjITbKU4nAgVZY1+4xePR+EmoEmbYV+zoRvf4cEERPclqXGVA5
	MYJnWMPNbsYKf1rV4zp4k10+G2TiGKtQSH6IWBfuMasNKLTUUZr31SdiRrKqr0BU0Rxu591Cnus
	xOOuO6qOCKeglbHx4EaovHX27Q2yjCD1rNp0CyNcJosiq0PsnddNEEHZ5jYQfSjtrF+gLrVOlUf
	/n+CU9v0ZugOgugwdEg/DdpUbD2weqFmImOQsLTzkPrBVHYCCz14cwljvJTOLA6crsm3xWwUcZg
	AaKMyUHhMQIv/JgGmoKkcZvtBGT6vZMEf2uyillPr46CEFH/jAiMfsockf6VlsEy+h19MUeFU+3
	0ykIJT6BQf2bre4p/eJuUPusemAlX6x6oUfGPvHiQHOBgn1wy5p+JSGEqTKIcdvVKkAyWSuSyct
	U5sXL4/xVAPLz+jowx3x5QeylKvxYbSmsMOOUm2QU4jdW6YLWu28SlDSiIVPfWU+iYw=
X-Received: by 2002:a17:907:868a:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c5066b51879mr466967866b.35.1794491043119;
        Thu, 12 Nov 2026 05:44:03 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a570a9bsm351494266b.28.2026.11.12.05.44.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:44:02 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so5732236a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 05:44:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGxr1PkzZ4ORqC7vhmzNWIGAW70RftIqjJSDvm6iQ5wfh086j1B0J4502w8lc/a5tEvignpXBBJJ6vl78zZ9uFwXA==@vger.kernel.org
X-Received: by 2002:a05:6402:1bc1:b0:6b4:5a9c:4e44 with SMTP id
 4fb4d7f45d1cf-6b77770644dmr2967919a12.37.1794490681628; Thu, 12 Nov 2026
 05:38:01 -0800 (PST)
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
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 14:37:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
X-Gm-Features: AclHuK8Bvm66uPuRAPPxi-MPPvPl-KdDJtyohfMgnqBqTlOChWJE1Vd3ab7DaZs
Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] media: rcar-fcp, vsp1: Enable on R-Car X5H
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Phong Hoang <phong.hoang.wz@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased" branch [0].
> A branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
>
> Full summary:
> /dev/media0 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media1 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media10 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media11 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media12 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media13 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media14 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media15 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media16 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media17 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media18 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media2 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media3 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media4 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media5 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media6 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media7 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media8 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media9 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
>
> The last patch checks the device revision and prints it, which is useful
> for debugging but is unnecessary processing for driver operation so it
> is marked as DNI as well.
>
> In v3, most of the patches have become DNI because they depend on wip
> cpg and mdlc driver work. The non-DNI patches are targets for immediate
> upstreaming though.
>
> In v4, thanks to Geert's new rebased branch, all the clocks and power
> domains that were in DNI limbo have now graduated from DNI status.
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased
> [1] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.4-rc1/x5h/vsp/fcp
> [2] https://git.ideasonboard.com/renesas/vsp-tests/src/branch/epaul/fix
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> Changes in v4:
> - Change the clocks in the dt nodes to use SGD1 instead of SGD4. (see
>   patch 1 for details)
> - Removed "clk: renesas: r8a78000: Add clock for FCPV and VSP for SCP FW SDKv4.36"

And it still works without providing these clocks because the fcpv
and vsp2 drivers do not manage clocks, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
