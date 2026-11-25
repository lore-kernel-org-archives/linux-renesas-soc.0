Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618457;
	b=Jct6P/WtKQSVnhnD+5ziycj2dYKz7pyX6itLPQNlqcuHW/tcZxAeMmMV4BXCCVzLs4y3
	 +EbIo6EQptK3MpVLCka7BKdJEJDgL2oB6m4cRmAETfZ9PmTj7HUoaTIwjXdibspe86ajP
	 Wto75BHHIRBRcNPU65H1T62xIVEUKt/rWS4L5Dddex9dUftg/vUK/YfcyHiux2vTqjvbP
	 7cMdFLpZh+xf5BYKc1XzIsxoVbjmDCB7Uf0rgSIOTUHIXRHQ8b07ZJJn1z3+kUUNj9St6
	 38Lx5Xv/yMKbb3NNiOjW4mYYNkIS0YwUkvveypRs082ErActyI0cCcJiqgl8bC7ctxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618457;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
	b=PPJj5lOwLRNaQq8vq1ugnfHxvfKCwdm96nwIrh/QWO1R93Rp2IxYQ9jfgN3REZlN4QVq
	 TKI79Jbo03+0A443jNZgjaJhjkVXhdDUN21Rniq0qgBg4hUQ6Bsu4XVk4GfboorYkEQ6T
	 lEldyZUFsXTcwTMpjDZSpzSpS/9zff+cgpa5MabGizgo2klqtZKyqcOR13G2vFnXYxI8/
	 657nJnC/eEz5owqZ872z0f7OIdPEe+KDBi5FjEnL20IibpCmg8zny5CZLCkdb9H+zD6rL
	 kzGJyMm25kS2CKgB4ZAQEx3j4fEoHS7LxhStwM6znPh5FAq22rrJ5+dMPHyMU4oRBpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181B7606A323
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181B7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55d03bfd477so67080081cf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618456; x=1796223256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
        b=0p110EgMDC1OyzETmcUMXJQnm5HnvCI1mYGWzppqSKjO+mdOncp+lpeXxshkEmhF3c
         X3C9ZyA4erIWFLOZXoNcSKrPHIk3T6BIN4+b6bQd1/g+1GFtH+qZRudXiR2vnAlv37ws
         4Qw4qJFTuIICj4KvQ1YUQqxgKAfru5dxUn15ksj1k3FWCNmKmaBritmPi1jWsljdwQ24
         o0TepsgdVf5r6nDmr/91aXd3lChF6CfZxHsIem/JJmtSNF/Nw1U3dm4VaaaD1OgAmw9A
         xBIfl6D9XYahHppShmt7WMcycyNS0waIILV2NcBN89BDxv6e5SoaOpY2MLDRfLOv9M2b
         zaHw==
X-Forwarded-Encrypted: i=1; AL+hErFv+I5v2R0vtXogGFgbqciHo6ETZJzQMy2nRodHtxapjI7SHpV3Z8HSzD50DjIrXJiYEWd3M1QWBY+tlli0kxSNUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vyEkqxywwti6zU+0k0F9QRWZh4/Gbpqw2tGQQ6n9unIyk/taE
	7s9aHXLSc6TiGwTv3CYaPnBR+Qto5BiL2ufh/EiofJW/8O3RAYqjRXQlufIBYv1g
X-Gm-Gg: AZFdTZdQDSRnTrTXg7KmdRU71pUnHCSVh5jKtcKlDhadC5G7fkcqkOcLhlquZHckxmk
	dZjjVUAz0oaK6OivMMkuhkHpoYrNNoj3IWcCrVhN4S/7lZvtACNB1k7TzcD2ugjIPs+hwdTFKmy
	4zost/KAsgYJVVwcMud5HI6/73DbVS0HkbvZvURA1dFt4BEJJv/HJwV8MEtKqzdMGF4L4JV+pu4
	2vlW70ry8dFcQP1gYfKHfNGOPawF5LY2kICradbLJ6nV4mvjomsk3KYfTboMKrDE28t6DcCG8qp
	Fzwx8ArFtopsJAwnY9rLhMd6orx75yZit93Py2kx/toPHtteBEx3pxPbYH6odzlr6ghAjVdl0tO
	iKFWdWhjE0uC0OXqkzKokFSHMVBNVqLuyDDyVnmmoXtjCnH/aGfe70hPGJhbJ+jdc2Gk7CoaURL
	A8TcWEtKIp03nECNyihchBYti5EaTprznbRpRtODSR3FiRdRKDol9wE3NAcxTUF1SbfsIMYe7Wp
	IxRLJisvIaSZRwnGtyzwZs1wZoFCF2ibBZUyUf17/wfYxFGp4HqVAfaER7DQKq818nWtHeYwPbK
	wjJKjeWYXerQBOQqHchUqDuBiza6WBgoYl+G3x1/nqlf8I7xN2ftxvroez30s87G+Gg=
X-Received: by 2002:a05:622a:1a8e:b0:53e:35dc:9bcb with SMTP id d75a77b69052e-55d76ac60a9mr367015071cf.61.1795618455905;
        Wed, 25 Nov 2026 06:54:15 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347966desm161987346d6.3.2026.11.25.06.54.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:54:15 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921276742e3so54522006d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:54:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFqLXoheprqt6KEzlcnsxtdQmNokELDGies6ARFbu7x18gxjDupm6fdBe1CPF6y5RcKw7SzA+dPsRetOZoCS0zkhA==@vger.kernel.org
X-Received: by 2002:a05:6122:1daa:b0:5ea:389c:520b with SMTP id
 71dfb90a1353d-5ee8af0b136mr10546236e0c.8.1795618054600; Wed, 25 Nov 2026
 06:47:34 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
In-Reply-To: <awAqqg6F2Z1t55x2@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:47:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
X-Gm-Features: Aa3M54pxTFdlXtNPAY9vlRQdDdU5I_xDDti_PqZ4BrybSMWjBRbxoSvFUUiO_NA
Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 20 Nov 2026 at 12:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I don't think SCMI itself introduce instability.
> > It only defines the protocol, and each firmware choose its ids.
> > Could you tell me what you mean by instability?
>
> Let me try to reword:
>
> In the past, we wanted to support all kinds of firmware. Sadly, each new
> firmware introduced different IDs here and there. So, we came up with
> some stable IDs ourselves and mapped them to the IDs per firmware. This

For core clocks, we came up with our own IDs, just like in other DT
bindings where there is no simple mapping to hardware.
For power domains and resets, the IDs are derived from the hardware
documentation (register and bitfield indices) (augmented with a few
power domain IDs that have no simple mapping to hardware).

> is a n:1-mapping of firmware IDs to our stable IDs.

Unfortunately this is not 100% true:
  - There may be multiple SCMI IDs corresponding to a single physical
    resource,
  - We are still discovering missing SCMI IDs for some resource.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
