Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486960;
	b=5lZ1qf/chVZ4Kno+pUQ8Oi8edygg0rG4BG04PUNgMjrHba4TbeAjUrwYEPc+Zqcu2ACe
	 8VB6nnORv+vXQGigcUzKEjdGrVI7aGHfYej6qU44DYaULSo82bxCXkLehftIhBnsn7q1u
	 TD+5dANgDIgJfNssvvmSzTwU9Rb397cOiaQWlXpYrxLsD2N26ryYqbYOyZajdeG46F+EB
	 cVGKKukY9Cch8iea+LZC2dYV8B3ViGJnCCzuEvXQVT2QLExVyGbRg/lv7KRzHJyIHkhTl
	 ImXqUL36pPjK3huyAg4pRsVnfT2WEbz5B1tjhKsZ9/GmFlVoZ4ot4+qeT9+F1yKfFew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Al/HgAlWfQ6iceuFxEpzqibnoieoIm43yof5XL41sFg=;
	b=1qhIWa8SWw08ex/jxXDGxtdMPKhRE4FuREjZc8st/X/6+3BzQmcY56wIdTOGJaiucP0x
	 alynS8ybGYxVCbKMDZ76eGpIP5BIljdH5a1qgyCV2mHWBCJN7Fhx1lmXrUpCnosydmfR0
	 uHyTzKKU2LmTuocLNPdg69LBdZgjhHSg6L6ClB2H8FpqSwhJ6ylhAhvmGzNP9ereLRtnn
	 DCDGpsMdWe+L5freWkQ4Wtw5vmNJSZPlmNZi2WDEy2YVWxw2DuNw9jW8S9rVmb265M1X1
	 9d7t7eyAN3Yd1zpTFNOU5qt7hAuCdRGliMc0Riv9Zo1w7tUyVRUDGa6Z47G3qJiAojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WevY/F63";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCEC606A321
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 02:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCCEC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WevY/F63
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccca948203aso3358006a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 18:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486959; x=1796091759; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Al/HgAlWfQ6iceuFxEpzqibnoieoIm43yof5XL41sFg=;
        b=WevY/F63WgcrmmjbcFRa0wU3f79Y++u2Ms6yFCScdMmM3rFtSjM15hePh42gU2Avph
         xJ5Mz1CVB0BGai1lMtqC6gRZV4JEt+dDqS11BQBys5KQUPH6Up+/mRAZnQ6au55fd/iT
         uEDLwUJmYPXXLxnO0OPF+UKd6OXxunLK6kmj/YiQf0u//WJgwjd78uMDME2hZjjJUL8Y
         gxKqgqlrpv7aoN2JgLa4V7KyM0FZviXfW3B+gzhkLTvcUHwSjRLKsPHcaQtpIlYBwO7G
         PkpxGDFWGDZ5ux9WV7vK7FfbLHN5gGbucVGahYfKpdVU9CEhSNKBNT9cr3CbCa/ir0N1
         WFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486959; x=1796091759;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Al/HgAlWfQ6iceuFxEpzqibnoieoIm43yof5XL41sFg=;
        b=U2RXFWYWaZIrOuyI5KGksdN+JSTiDoxWwv47jmBN67zwafwBPgRD9ntvJZJDUB8D7s
         h6o2K2PYua7P15Wvwp0TUPZKJWcJ2Tvm8bCQVLWmRmPPmvsYlvhncSfpYUTWlu5kCWHq
         R/ewphrQNdZg2Cch9H9d3UOI3XXWwkB8cCNaDfjgSWJ2NK5zjqztVTJkiaVzhDI2h+Tc
         kEpomqxeTkSUGgCxrEp1ypnMmxwNZX/xPFtBvt/fSFO/C/4LfSiwvB5Q/YWSerWiADiP
         h/hJTqcPRjMLiriMV4tV23hCEpte1kVKCNdrRem9CC2lPsWsFeJo+XtSVdoOsvmA0wDy
         u19A==
X-Forwarded-Encrypted: i=1; AL+hErGZDcFCMV41Dybf0VqonEC16pnqovqek6lzbB/FH7Q3F7e2wjO+cxxHB4a7nTlg4HtyWiDoggXTxUAenA3kwSF9Tg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bdvzXw2nhGNVBQI6Om/+NPK7xMd3R4XOpL8fqHa65ewIMlgn8
	PwKzOG4RTtFELTS/eC6P6L3Xw/FTyiGFWS1DS+5EgwYAYwZGqCipxo8g
X-Gm-Gg: AZFdTZdZpDBzAkuPjRte4aZN+492n4Dngr0UElyOq58igDkCN40PAc870VU8PAFM2Uv
	mbER7iSoNtiG8BZvlFJrQce4Z8niawpxZ8yYlStFEbGK9Ci5g8r3fw6YzKdzUhqqzGUN9YH8gwF
	DDczCGSPKVhs1KAMC5T3dt+U+ydNET9G6ORwCuUPS5n4o3o1mV2HE3UFDPLyeiKQMbnsOiv4vGb
	9+f8eGPQBL6AWVSWA7SeerbELZuFOy3pHPnQ84+qIievpZFiNc4uqPhekwDbX7tG9Hka6xZgJdP
	h/fTebJ/JaDOn0/rDmdJzEvXGWNqBB1cP+zjnZe3k9Nd6qHcIFCxqFeUr4ssiT9mt6UOk3akRQJ
	rm++QHWOwirteT6VvWhdzt0SypZYlPGo65I8S0IE9uCdrdpvqUEMjvV66jK4dQ+/ppYgAgRhN5t
	/ryS06LBAb54qG3lRM17kkYjr3ip/5RqsLwRT5F9GXpV1OL/n58AEK9/jgGvTqplaH0XbZClQU1
	OCnM5pbFxMRUa7vKcwpdUmmrza0AH7vSQ5Fvxq9YixvPdwz2zuD8MxlbsdmcQU/ZE/5AOK3uYV+
	d231tTjTS0uF8MLWB6spZ5QAkxCI/DVYFXlnZXaZH7H98RMy0Wb1kUFp5OPYL9DU4JlaQnnVow9
	o6wKXi+bzl/tHDWiGsOjhhOC3
X-Received: by 2002:a17:90b:1c08:b0:3b3:b632:7f2b with SMTP id 98e67ed59e1d1-3b41c98a3fdmr10861646a91.51.1795486959115;
        Mon, 23 Nov 2026 18:22:39 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm8425496a91.1.2026.11.23.18.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:22:37 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal: rcar_gen3: release the IRQ handlers before
 the zones are freed
Date: Tue, 24 Nov 2026 10:22:31 +0800
Message-ID: <179548695107.1834709.12105107414276177799@gmail.com>
In-Reply-To: <20261123064745.GD3898744@ragnatech.se>
References: <20261117145348.1092528-1-shunsheng1218@gmail.com>
 <20261119022926.1493582-1-shunsheng1218@gmail.com>
 <20261122144813.GB3898744@ragnatech.se>
 <20261123064745.GD3898744@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Niklas,

Yes, I agree.  I have reworked the probe to look up the IRQs first,
initialize the sensors with IRQEN cleared, and request the handlers after
all the thermal zones have been registered.  A devres action disables the
interrupt sources before the handlers are freed, so ->remove() is no
longer needed.

Since the thermal core copies the zone operations during registration,
set_trips() still has to be selected beforehand.

The current version retains the no-IRQ fallback for -ENXIO and propagates
-EPROBE_DEFER and other lookup errors.  However, if IRQ lookup succeeds
but requesting a handler fails, probe now fails instead of falling back
to polling.

Would you be happy with that change, or would you prefer to retain the
original fallback on IRQ request failure as well?

The reworked patch builds on arm64, but I have not tested it on hardware.

Thanks,
Yaohan
