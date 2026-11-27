Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771035;
	b=y2oc0caDruuQfjsp8V+qCeClioJl+l5Tq8oFCSNPsyXQm4tl+ppwJsIYWKBh7VKksLsx
	 ClfkB5KHS50Alu6ZeF+UWD2+3+YF1VzrW6lgicmQTurleKSw48RxlfwZXESiG1pY9U58+
	 nfNnZcaxbjSEkaFkpYqwbQHIwyluikvjc4SDfXeZlq5RxppXd/cPb7EUcFD6tDSmv3kLs
	 ATZLncApBw2X3cPwtZyBQE1cjAnel0uDtqCX1VfPPgyNvkETu6B1TOOKQalA7CveWGJJC
	 qFC6nQqZLjKhwvpJhTgI6DCE/xEptWE0vrmZ42nk8LhRbqiSE4KRiQc5Zn9jBWT6YFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
	b=xCYhgncyEfGehfxo0K17wZBheG2NlFLyWh3zHr6BlEoAH5OvMpaLef/8WCcqQEyAfom2
	 blWT7myPkahQ+97Rbn2zm8NuxnMofiUYtzqQ3LyZkuMYqx1L/Q6UhwoOW6niDWHxEGx4k
	 iIwjVFilIKSzjghTki3qimWM2i3k7IEq788pbbbPaxsf0uUAaySPXB0k2YFFH6u2PjtO/
	 hBWP8AsuCRVhbTnm4y8QtK5SiAjcwts5Z7B7d/ivibK5uiZEr+6u/1lMVeOo91oR+b3FU
	 6gjYAOUp9WM5gZB8EooFz12besLucEKreBVY/2CYloVaAF+QZJVfSFUzLi1i6P6l8Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF4D606A321
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 09:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49412eb1474so5164902f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 01:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771034; x=1796375834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=iBRw+JF7XI+FsbMljrWUMpxaiKKpfOzx9BNFr1VLGWhsoqp2VSaP5SWnYO8z1hBxgi
         IQNbBMdeJhsysl+DyR6W0NanRt2DWD8sIglYpY/x5UY1LoWAgPv5ZUnnBfND0YLbUSfl
         Itsk0XaTbtlowa3WI5Gxl3k5nAWrW+1EmwyyX02Xxa/mHvv+dh/iykowrav92nNUb9uO
         Bj83vjke6GeDzVChb/+X4O5URXYdSZf9UGvHEF7bClbXmYZAtIIFShgddgG0GM0/SIrH
         tcAyTh1+lo13Kmdf0MVGZ9iMoPoBNW3igWAXE0c5LOGBN4lH4dIidyqeIIR4bXjt1rJi
         qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771034; x=1796375834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=AzJ8n4it4368enP3OeuxPACY4qCNC/mrUsF4nX7HDSAJhd32pDZnyVKn4EIVCkMBBl
         23IEVUcGUXLK0nEs168R9lR03qiiGeGxE4ZUACP9ljbZm+gsMev7uFHAbRU4KRczyLpi
         bQlfXTY2MjZpN7ifrrV4fGSTUX8913K3K5/6XjvoGUPaUybzStIpfakwXBjO3gBC2yIt
         67c99pGRWtB5NDHqQIKoTL51IKL44OV1fPlSbpjwq4tz2tO9dEjuY6BqJML5OW3C0xVL
         fm5mlRvVNeu8tztlTQ0VJPSPtfgVcZaXkJAspD1LqjK8v9Mum2azsfr39v6ew9l7WuQt
         OF3A==
X-Forwarded-Encrypted: i=1; AL+hErHDgJ22qWk64ogHozP8nZyDR6BMDcpP0XQYaLWGtGhceicw2fWa4rCufIRaWTL8vf8U366Yp1lpeL5r2gb/FhJQXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z84S/9C9bbP/pobjhTOQ74FmBGEW2y7nBjYhw02esoLkKCA8Ffq
	vTYolLfSz6Rqg+0Tu3ho1nrJNXrflJPbLRpZQbq2EQ1OifMdj6EdcGtCsWcFJlyJMRY=
X-Gm-Gg: AZFdTZf6C8UAAPA6/kD9nb2WFzZIDWUvPb5CAb4h7K4fVg2dV4nogzAIhHMNSKOLEWs
	wb6Bg+Wa8v3EPW+yM48nbAW1flgvqUrqDJfpltNp7/JXiTtpShaGd7sanpsXR4CAsVxHyz82jHM
	3XEPj8ufsrKNipgGN0IFBh8gmsWHCgWTOfbkgb7q4fLVuNVtXPTUKL+LhXe3ZcI18SZZegCSTHd
	IBN7NugdUL0itzQfD7PS1AfjZSZC8HljWanmT71+UvPMwQQjwpQ6MhXYNKWe9Xg8PrLLDLE3Hyp
	IXwt1BPRRgM3504K8TJBOiPEIbGT39tRQ4pVeYvgC5UmdMnI/33bl2dzVzDDksdRKNJSS0fQmql
	H5mWn81qDykPyF6X9F95IlpgdpN5ANrIWyWLkM2fw/qk5tIcp1LFQ9X+Y7bPPE3KStYKNXLhuBE
	UIdGaA2B/cVjxFFwzUOkhfrxEF4nU/dc6FRiaxyiZBK4QwDdww3tDrsBtSmXxPdt7Wxs4wz2qND
	PNlQ8ccvohExXUF+MLTuvic898FHFLIj7VTJqijIIq6eSiNQTzynBSXGIbBKVk30JNm5kQlY2HJ
	XwjGPVjb3ernl0AYEwpdJ8NWFM3FwL7EUiRq
X-Received: by 2002:a05:6000:2f87:b0:4a6:bc53:246b with SMTP id ffacd0b85a97d-4abb5144ebdmr45324253f8f.30.1795771033589;
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm45914055f8f.42.2026.11.27.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Message-ID: <bc1ac983-16ba-4165-9827-a7cde032c988@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:11 +0200
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
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
> pin controller provides a register to select between these two options.
> On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
> the Renesas RZ/G2L pin controller driver to allow selecting the I3C
> power source on RZ/G3L SoC.
> 
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
