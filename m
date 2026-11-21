Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266035;
	b=phBygQ9MppJBS1qxxk+lzQUn9K6CW+ptVd57BF1jmPvnRq2E5FYC8ME4I1B+YoBHgKVI
	 dcjujM4ktZ7h07QST2d04q2EJcPkmQk7IRkAKvuO2Kif2Hz0tAUKQe1N1a3NJCUEXAEtr
	 Vj18GcaXsbENvETTZgbcBscpCRVs2je0W3KNe9HQ5V6QTEJqcUxkI/ehHgSCBBTG49aOr
	 9VwUpKyd/KjdaKPHcFmmJMOv2RmUGPJma/+g3yauVW8bu4erkLcv+PrK666VFoEDjSjDo
	 +/4XVhkFyYRzS33hZaRfkqji4j3fNxBk9iNHxECMzUE8yQYUPZsHj3SBbS86jYLYktA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
	b=hONzDsxwuTXkOM6c8or+pqOgLBuWUqzo0sjry0+sMe9GEzrZmseKMuFmdvhqdX8LJVSI
	 o5qZ7GEIk70SPVsQsoq2Fks/GCtEkqN8s5nsy/JNOAMq8b8Vrd92bmkAJMDMpHshJDGy9
	 LO4spKKQbRcljtOQTjqzYcoEBnBtMD1UYZfiHRepZ7YYpPGLx70fqC9v57UX0DHK4F0vA
	 OBXlAzf9IQNRDTiLvLtVhISEUH6uWaU642vBWRTO7u/bETqp538FS1AdDwaEG8KkhXXls
	 dpdluESlYzEX9DCe8HmlfXX0OnBZPEeg0TH0luJuqfKecVud1upH5Kj7Nbv5llz5XOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3154B606A333
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Nov 2026 13:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3154B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9496577d4c4so211390085a.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Nov 2026 05:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795266034; x=1795870834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=RNtRAbmQYXLSiaEjtX2aUWytq3ybkP6vzvMM/GYzBbb22sqY7OMQwI+6PVQp9DHcAr
         lhyzXBhfLKqVcuJ8sVYNtP2aRDK4nll7J9DPE5KKQ2CAiVa+LkTWYungYQISMsCYyeh8
         hpGt4X4Nli6qalkIo2q0QmQpZOhYwDWO5tabVR1HVgZiiW3bleQnCJNRgfq3ll0kyepq
         3gsRAOgqgRVcju81U/9by/AXAbdfkcF2NzQSoJbhod4BZL71XZp0atz6aRPfoC9lunEa
         hlKhShuYNK3XPf/2DcuSXs5DhYd1yfNh3h4hIJmP4ba3ACaEg6LShMxd5328jY0CMk/1
         hndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266034; x=1795870834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=i9ZzUqbieOB06CWiMfuqHOGVCbMO925ZMjolifI8+po9zKzpNeF0IUOW4XYJKDmprm
         3wgvleQNJZBf6sbeZASH9rdBHS8LzAlECQvrLWVWUzuouobMuiYwaR7yHB3aHESDvaS5
         pJJIGBhJzsA0EI2UIDTFIJS9oEPrFUa1dc6keOiwDq5htF2Y8M2gp2/ov2dVA2qBVUTe
         7XHYG5hnpcQA5a+ipVNmFei+aij/yvOEg9OWaq89jPdNUTlg45d3r0DkdxCN4HP13vEC
         AD1+YFy9quVQvkYWGoCBaQw/m7NoWzuVbHvIVHVhea81tlEg6vMfePzEhs7RrtWXi9CL
         tcHQ==
X-Forwarded-Encrypted: i=1; AL+hErHtXfv4OToSQSuIxjqjN4TRoisBYHypaG8nxGhmcpndVIodcjJ3uIWyrC36AegJeNMNvRbN7daz6Tuxyk0ZsvxkPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8b8P+SLFyb8W9d3ZXdmNy/5wAcxL005/tTIiW/DidRQbtFehv3
	QXQLrlYf4FniBygMEBz6LLjiPcVqAlw3qL4HMb79m6jvER1nUFjAX06hwANJixkNxnk=
X-Gm-Gg: AZFdTZf0FkEPlPPq3MJHIJwgnhV13RNHKdRosDQt2Go0z1L0iTV4Z05PH3KtwXQLVvI
	+Jz5pXnfnxFw/TNU/kXinC0NQ1jAU+++sVd9nwcGfF0auOQPObOFhgPeJPUDJJHqAdao9Ng+qjX
	/dgnzydILEzOZ7RiQVVTq8f9zk8oO+96J6lRsk+aE/8xxJ2OyNOxPEUjhzW8miaPaKig2mpcmyN
	kTg/3Tkg9za0rXdbSSztI/wmDxF5qEltU7IxYVtlc6LJwan8+qnD5PQQbedCas/VQQsYGc1DMAG
	tjdLFfNMoXpfmJlJPJfSpv6QUaP5kpgkZj1rJi3+oiiME59yxLykW2kTNLNTxaNsSUgsDmnluJN
	7IjjOkr1PgroOgwhTJP2FxmAP2sbf6w18AeMSMKX2+WoOlFrqp7XNGl1AtFDL8g1Ba7BQcoIEjt
	wovACgRNQgs32p2S/bDy2XdRJn14mPeMTaI2OPTtZdIZ7Q16aXXG2iAVV+Msqg89+KRuVAPLOm/
	reIy9e2UGJgiHzPeOEvQhq0jPUO09NKTziuyROBKC71C00l+y4JX+Zgz/iWDnqepE9k3dkRzKuX
	PzMFRmDfj70D7YWi3UYj2Vz1MGIk+g5y/Km8XPKohyrdqVEtwSsPvMczNE+WNoJyyANUUWEWZJD
	RBB78f+oQNHRyu4iAMhwVm+KLEAaq8agQSABHp7T7fgp9D0g=
X-Received: by 2002:a05:620a:2786:b0:93e:5677:317b with SMTP id af79cd13be357-949b35e9b3fmr1046746285a.25.1795266033942;
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm408593585a.42.2026.11.21.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Date: Sat, 21 Nov 2026 08:00:32 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awGV8BU_AfaXQyBv@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro>
 <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awAq7vxcY8CGjhNl@ninjato>

On Fri, Nov 20, 2026 at 12:11:42PM +0100, Wolfram Sang wrote:
>
>> > > +#define R9A06G032_RST_TS		1
>> > > +#define R9A06G032_RST_MIIC		2
>> >
>> > I didn't find any listing of the resets in the RZN1 docs, so coming up
>> > with arbitrary numbers as we need them seems okay to me.
>>
>> Why aren't we starting at 0?
>
>I wondered as well but clocks are also starting from 1, so we could
>argue with consistency.

The clocks use value 0 to indicate "no parent clock", but only for the 
".source" element of struct r9a06g032. The encoding macros add and 
subtract 1 to the clock IDs, so it should in fact be possible to use 
0-based values even for the clocks. Too late to change now since the 
values are encoded into DTBs.

Thinking about it some more, perhaps instead of using 0 as the special 
case for "no parent", we could set .source to match .index. In other 
words a clock pointing to itself means "no parent". Worth changing? 

Ralph 
