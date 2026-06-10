Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8502272E6D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781063484; cv=pass; b=DIDhxZ/lDMc1UU/ktrFivM5rORUggzZe0avQxKc76hVhPAtkMiSWCHbLWp2Y5UGRLpSkdWkSuktO6w7goieRV4lW8m2np2UUiFjFhYxNJs9rgcK2Y0Kl+sL+EMQxdTwOlP1i+ocCaeBOwSg4driahKXAG6/4XxAUpVwG+D5RGfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781063484; c=relaxed/simple;
	bh=V98JltAyEkn6qhpFu54OMxe/3D7dQgiMQHy3kmlT/Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qfxsovnl3sxEUClOmUVLYgkAzR7D3UNh5/z1boA7ffKdvaxQyWq27T2HHA/+E0VIYHgXFGj4WE0f9Av2K2bDr870mh/31oRsEHzyEbbUwYcvl0H6Bs/01f84suv7ngatPG9cu3MNrfLpodm6J3T0ID+eQkABTm4jR/sQEmR2UHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMaAyKXD; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMaAyKXD"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c859a374903so2197300a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 20:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781063482; cv=none;
        d=google.com; s=arc-20240605;
        b=i5UVXEEhKHbrUznKWLXrivE8Wk3lg8aQEjha/zkL0kgDXa8BrerVzxZwZEVgqwB+jG
         cUWBvfyYqxgs2hVCov6v4H2VMy5FPd9kHDgbK0bOvMWFq+L/Y1GSY7m4EVvJ5jsJqDoF
         5ex4lE80yTlHZ6ZUoWDallJGyKPH47IcZvW7nFgtnoIT5GkxpwxBSCrkAdmnPBuT+EbB
         GGc1Fx/pO7YKlWdd0ySvONpgdKLeERsbbbcFRxcOSuDT5FnsN29PmbgzV3UcCFqmUase
         m18rotqwsjmMen9VewgXwks65a3cYdHOWs3RUn52nQKiJmU7A23+3BaK/OgNKDdjBRRP
         uzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V98JltAyEkn6qhpFu54OMxe/3D7dQgiMQHy3kmlT/Qk=;
        fh=l8G0kWSkM+qKR846SfYX63/MLaRT7VzuzH8pBRXQHp4=;
        b=hGHpZ4J82Lf0VbWyb9hbX9PL0LNZ5gU4qNCtk0/qhADq4gkcwrWnjPy1g+xd4xFnfH
         nBs26G8Muc5+wh3F/IkZO5H1j/xeFlIFIcDYJdwQhkHhvVBiYFnbD/ARXdP6fMaO6+xT
         7J6SCJC06wHIbH0KDI2ka7TWWmksVcomCFyrpS6McJJ0yAh7BV9n0tP1XQgzKAJ5zWZp
         AOU8mYmRpJkw5ck5ZC3zeTEK283rBRnHwzOz/D2VsF19b7nXYI/7ZQ7geyMbQtuYRFtG
         XgOa/gQw0QvlGd31plxL4jLV02uYXmJcOH1Hlbjh1i0vF12k6+J2Mp2psPMntIo7QJsT
         LmOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781063482; x=1781668282; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V98JltAyEkn6qhpFu54OMxe/3D7dQgiMQHy3kmlT/Qk=;
        b=WMaAyKXDvsKebe3ajLA8s2QTa2MieRhwgUT/EMNryGhVESh1e3cgXG2i/XhxIDZVto
         XVdOEGIkW+sFLMSyKt2/svq+a/utoYc2RjoVDpY8yC/9pWwGyE9dsxEbR+wJ8JiINWa4
         6avR3lgHnaawrzADa3sYIUk49XlDIXCOe0HaTLGX/YySUcX0UqV9jGk/Y1NQwPHnECRX
         f/Ck7UGjSe/NHLwkAlFSxsOr/AAmFTIsgtUqrrjOm1hAnGobKm42fDslJzZDYhmKWZVz
         F/1z4uGSjTpGDCg/Zj8m44nJqqPv6MsipO7v0YGYtRLXK1x8r2Q9ABmq+h8kNqoV3Szv
         PN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781063482; x=1781668282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V98JltAyEkn6qhpFu54OMxe/3D7dQgiMQHy3kmlT/Qk=;
        b=RQHXPkKCrJ6z8jlpOkz2nSetb59QpCxD17/LsKgwVpGkAbRTPt4dIfp7NtIPBmfci5
         YaX8Ph3gFBpyqAxFBsUcmuXBEB82l4YvGaLh8k7oK1awK3bhBDmrPz8KiAyqo2IgVYL0
         4VUZ06/InQhm5RGYdC96yu91Rgte3MWqoItA1B+1UN58E6TdOtCATq97zyOcoJdKmk0T
         auqbWy87B4uPc8rcgEvFDBkrf/VxC3Jov48XAcHajDS5bAXvAs5SiF6qrz3P0PzZZnhp
         /VxyZkQl3TR99N41heBJ2SL6KDqDaCC1ldHlplzB45e4QsT/MVkfiF3in0vOFcgGnzZv
         qnPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iyWLyHRgHVa5DtoS5PUvN2oIMqB+rk3fXIb/layX9xYIgYgY+nL4VZbDjUI4n4je6ernNA7AnuNl6FEke/U809w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBf9vNfN2PPYhia5u1t1XPi2InE4mk5eHcJQVrDKGCJAsMVzu
	r0UCbtIiGHVUSzy0DxSscLzuJLnbd32xX34YkUh7xME6rPBjqvtxgpnS3VhUyV/u7m9PZTOa6Qe
	9b4U7qkmLoRmhyiqNZcVv4ToXBNAE9Bc=
X-Gm-Gg: Acq92OGT9DSbeA/jZuO16jBcgplLlG/GDT0RxD26ZeEgqYN+Srr6JAxM1YtkoL6qVKi
	cNVHVS8HhFB+R2BWdvTtGP3hIIfujDpJc4+OWN3xO2EqPmZ4K9/3MIBGga80TdLHeeq4k6H73Ul
	qEI/PuZFVAaOlMUMvPS76zKMmJpyr6iEBQugf2AJ0Yia8nLZO8pO/dVw3+ASaS0l7b+RfyvOi1P
	+f8ATWUbngOdSZdsDDtmvdxFWiW1pa0AxamtmbIj33Cmq9MDHpdvzUNmra4NlSdbhzfDPMYktTK
	DiYeQ9HjVB1YJbLhGKalPrWRQtEdbiB9EgNBzdPLWBUSGg9A
X-Received: by 2002:a05:6a21:46c9:b0:398:7ffe:472f with SMTP id
 adf61e73a8af0-3b53bbe7ddemr8176176637.2.1781063481857; Tue, 09 Jun 2026
 20:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-2-phucduc.bui@gmail.com>
 <20260609-eager-nightingale-of-devotion-b6ca1f@quoll>
In-Reply-To: <20260609-eager-nightingale-of-devotion-b6ca1f@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 10:51:10 +0700
X-Gm-Features: AVVi8CdZKR_uJCuqPpU7lvaDdZ2lLhaOObi_ZoDUvMu1Slc74HJdSHgV3aKtf8g
Message-ID: <CAABR9nGuSJ96reQmZqCNT2z-z9op4N80xTPvbWHuVwC-6A3exg@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof,

>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Thank you for your review and the tag.

Best regards,
Phuc
