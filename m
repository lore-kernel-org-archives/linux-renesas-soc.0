Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312353;
	b=Z0ZnLvz39U6qId8peSsLCgGomxpqnkbfiXG6jztys1C2vtagMMoYBx5NVx7GhohvodKC
	 2u1/e8NjiypC0U3v/N9oRsBMwTlJyc0zdr2ZITLyU+n9+OkcUHWOUI2/TUxJgPZXvy5+U
	 R1RCuoZI9plYw+5s6O5/57S/yxUn63adKAIUtSWaWba5vsJr9LRhHQlmPukA+23hEVCsX
	 czqzu8SWjn+jZtp/RAhX0HlrWMGHpDL2t6VLt8RCpXxlhE+iV7/Sb5MQM3tJz6RN/8eHO
	 gpRlaIb4pCM7sg8Pj2VTKrMaQz7sbAjoIUVZ+HTMe9dk0r6A03jTHt98IqGkU9u/OWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
	b=OaPZLRY1K7Hm/liWVVWc+/xolhypgOybYXf4/zRmuuryvNuZ0DqGKHPL/kUP7J8RUZ70
	 ZdgqKhncU/8Qew/dbPynzf53qgtW3CDxwih5XmE8FTuP9Hm841N4aUpVu+5Zsg0TLxQ+R
	 3gpxqc5qHSmmb+14SZUxCeHix4asMAq2G5B6nqdFU7BKb5okj7l8/NuNYwoYJSTCzy2u+
	 64CHt3VtT6ZuF8L9rmLyZ1fXbPX+gfDR7QHe8eI0Uab5HO5OVJEx/Y7eZhJ/jR3lHn/Tp
	 4OjFckkL4EVszaEM0JVQIwNKWM7q4X2wSEq442WN/po/hpESgG7vIFdMJ0NPdzVL2HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F6606A325
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 12:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so23112525e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 04:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1794312346; x=1794917146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
        b=LF4BFKzrTfKOrCuSfp4DCyhP5JXW6aLC8XDTOi3QC6I1vLZtLE95OOLLw8+PaO15OD
         Mqzsu8ibEbOPvk0C0LZpmcHuoWuVD46E4lCbRLNSR4rlywp/TUbyv5jDIrUHnqRKUN0+
         VgYmCiQFOWw3por3vt60eXOGS7VxhrTSAy2uD5KjqibIYZXvhF8xkBxmfq26pC90h+jz
         nKnTq6DPVdhiHAlRe3p9KUoVmEpDTiOAWO5AsRJkCiuO3TGigutjr1wKeh2R+kZU8E2o
         7B4YTnJAghxXdSsuvEnENaGO3330T8hm5HVDo0cO+QeGHXLRYcSbSeMAQmUnkuj/DUfe
         xkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312346; x=1794917146;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
        b=rJ26jWLfquIIa3ay+lSKs/xjEPGM1q/npNeagrhwK+jS/Xm2RxxOcmIw1V2nyQ8rt2
         WlRzKI4QXE9eI4vqP+or1cmZ0UK1qQwe/vbqRAYqO93FvFzkw8+doc/07WI23RQtVSwO
         mMyF7/BINQeWpxVAqdzybbn41rR5t7u5Nlth0OMa607dwWaW8YbSYz29sSuTrhNlzRn8
         UyG8utCKyCdi2AXuiZ8WjOxj67z6GQ2jKxxrztLEHVphsxNm4yjXsf7T3nrF/JSoH+RN
         47A2Eh2oQCYE/Ds4sbutnqtye3ZR3IlQtHhlYX1Dopwznd+vNAPnQYBwn+QAJ7xpEc0u
         9jfA==
X-Forwarded-Encrypted: i=1; AL+hErFEQvtk9o/3wrujKCBJgGc3X79hzjAXsnhth0M0Mw+s9QwgxgiBzjhYFE4YogQvtUsS2BP+c6+FA3v79z6TUoAdgw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ow8Cvl4Pt4bhGHYZh2WLja06yv0r0jeUBQ7W6eGqh2vaVSk6S
	e6Hj0Ia7/U1ePzfkzNOnkFYr5bB9k5+WEQXc65RrXxH+Erua+KAzGielBpxRHhlFc7g=
X-Gm-Gg: AYBFou2nUo0kUj/bVctHdSuiOAimsiZWmwcDSzO0f4+uNu4XQqgwyMzifDtKn1upCu9
	cBS5QLZ2goJtxMBvWIAgHPCrpzR33C6OYQgvZQ85K9TbE94UAmA6rvoeimUPHWXL0rwS4YwvMn2
	OzjT//y3RbvSnrPgPcJnZtO7KR9cGhRaDiKrJwOXt7LgY58RfuSfGFRmW368aRAeDGYoHL19CU9
	KPm1JnquGi6eDcwiIhJxEUNdZvAZ1fOR1G9i9jYdRXQ6CFgHTejsPbQGb2jpga/KcZmiqe42SzJ
	Lb+h0e65+MLnuGTRslDPyFwyc9hI0uczqSYn7ghV7+FlFysCCO7OxV/1z2yGD6I39Cqz6z4rmgw
	19IloOv/z+LVfg8xuhLpUwJlluJrRTPhFGkHJI9na2lr+vUGcAQ2ABDpY6ah/encsxM36S+DYcJ
	sYwVBvKKxe2IrA/6psPIGrQVteOYMCp5pgB/YYpkLnO5OF6xkdsUuq10ldaGo6SmiVaOQEzN+9F
	3l5uHbgnFQ6ywsGHgfkciDLsl4PTIP7AGjFeSbX26etQnEXXDRRWYVvcTH9QuGi9mN0aJXQ/fNI
	Pr9n1rsJw4gcZDTNAyAl5UYKrd2fjN/Qr447nttd9dkL9yeKON0QIU+8xPy5NciU/kg2gs0=
X-Received: by 2002:a05:600c:3b8e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4ba023367dbmr51948635e9.10.1794312345435;
        Tue, 10 Nov 2026 04:05:45 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0223c41csm61119315e9.14.2026.11.10.04.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:05:43 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Message-ID: <dbeb92ed-4bce-4de7-9699-6a8eb6a07284@tuxon.dev>
Date: Tue, 10 Nov 2026 14:05:42 +0200
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
 <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
 <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
 <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, all,

On 11/10/26 13:38, Geert Uytterhoeven wrote:
>>> Thanks, but six weeks later they are still not visible?
>>> Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
>>> resets in top-level"
>>> https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe- 
>>> mkl@pengutronix.de
>>>
>>> Am I looking at the wrong tree?
>> I tried to get stuff into the last merge window. For various reasons it
>> didn't happen. Anyways - I've pushed all queued Renesas related patches
>> to the can-next/testing branch. I hope I've collected all the latest
>> series. Can you have a look?
> Thanks, LGTM at first sight (I guess Biju or Claudiu will scream if
> something is still missing).

LGTM.

Thank you,
Claudiu
