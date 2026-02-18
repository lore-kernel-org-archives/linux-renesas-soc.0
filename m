Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182133D51F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408024; cv=none; b=sXr1DBSXUbJkedZQ7jtjnyPKrddZropVc3ccnqryezXOyHim8ybxmBIyazqAY8wgHT6Czkm1Ags8n+HJtwI7apaSyQVkQKzpD2FVzdBYjo63mMnAiYpYO2ApSSZfA3AKvwJRsrhokjnyM+1UPfkL3xmm/jFaACyUP4ONC3HNnPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408024; c=relaxed/simple;
	bh=ZyrO2BTUvvC0XGd70mrGogYUc7XQ4XFmboQrARHmUCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWcDjaOul1/uN6oxA39leM4mrPnTKklaJU5FzbkkemC/gbFviMMD8PqbMx7iA9GZk2a4bwbks1f3ANtNc02o71hBcrGO0FJOE2BZ4uAeYF1fnuj6ojKet3NtOkmCAiLYNH5LI/d4lSVVGXX9YH5yUy95+UTMK8Fcy+u2pGH6Tl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hF0pr6ji; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hF0pr6ji"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48375f1defeso39470115e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 01:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771408021; x=1772012821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/iyPc1B0BPSkZP0CkpRNAjkwIO7YfmnXVuQxXaZEPfc=;
        b=hF0pr6jiId7BdBML2N7RUk12zSTJ2+bZdjrYHWDSXIJpZSDv/EEKhEpH9cy7D/ZUff
         iVXMpFFfNTJAc2/h7/H37fl5cMP8rC5VOWZTHwe7p1dVKxgtQ+9/u2RZTJKZvldHy5/W
         ScywWZZ0i5CK0KqDk5vBRX9XP5N3MNwgEJ6ALcsLVMw/c7iA7Y+dszvXMEsTgJxilweL
         RzfcvG2VdJcwJJAsAlvfUpjPrQRNAQO9h2UWx+3uwsBlM2B1tPisPsdhQFQiLmWDv7Ja
         XrY3XFGPQlOt3KNUW4Hkjkjf7ZTZWAHEx/RZe8zbtmrX4NDmhM2+G7j0+cvS8uYRY2/c
         4xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771408021; x=1772012821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iyPc1B0BPSkZP0CkpRNAjkwIO7YfmnXVuQxXaZEPfc=;
        b=JwPZKaqaQMKlDnairWHzaX+84GBM0isb5IBryuXR3yVpWksblCffqoxNBl6rpumggY
         2zqIGBUo7psYQI3xDoFSeakWMWrUVXPckMjs3q1CfGI/wvxXmkhVPw73qFsCyiSnEYYa
         Pw4dcO6imBoHPPL6PeOERfekxsNIHbUbyweLdTBipIrWOsiDoV6BJpjcupXTJNWhQfil
         pt2amtvQqnFga6qEF6TDFd419mPyQCOjYFXSaRpoTCDQ/EG2DDfXkDq3fAf0mY8lsRFB
         +z/q36sU0rL1Dp8hVyjAlz7X5RuM3cAd7xasfTgF64WoLjKtI5JotuoNNM2PQG3qOQoX
         yCgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpUIWk84VLOgiMzIiEZ7FVO9Y/5CLP4hZ4uD7GH00eze4IWOF4eJbHDJy7Toxb52GKgZ+m46KenhiayxX90W17kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/zjLqjt5Em5aefhVSavV807j9Ft2LXiRsTnxDN7FmWmRWvty
	glUaJEMz8olNqmFLgh3+UgehMZpbqh/RTDQEx7g+ifnkw9jF4f+wng+nJYGYut2dYGU=
X-Gm-Gg: AZuq6aLhVSYxroMJfVGX+dgW5Co5umEXetuB5fm3/wmCBmHCAElBA7fqZlFcCVMQc2a
	k7l4E/o+WHossNRq/5JJb6Li6QNctrLGKxMjoPGV2+KuAaC+ba5sN8gGUKgRVNvXCDXqaA5pCHY
	vBWOUPF3kKkplyNKgIQyIdvmTQcJ/0QfkM58aEAVVCI52Mpz/4waMTm+B3+LmgXKpNMr4xNIxyb
	MiTgQK3U/4yKPQEgY7INdEouU838hfnWjv6mt70PjkAwxbryUUB66Q+fbQF2TvS4XuAz8eQkWaS
	eLGX6+SBZKLPBlmC1IwtQR8KFe2v+TvfRSwRhkQiR+2wxMgyXLjiZg5ZwAROv/QZBZgDk6Jlltf
	MHsDobw2lpOkChAF6S41zskuqTPHTKQnXgEc8YRbARPrvmdYHvRs7rW3LW3SX+LELz8uzGNxUfN
	oaq7p7PxRQmImfbDXDy7MOGdMUCVuR5w==
X-Received: by 2002:a05:600d:13:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4839b4c7242mr7100315e9.5.1771408020940;
        Wed, 18 Feb 2026 01:47:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839712336fsm15853195e9.2.2026.02.18.01.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 01:47:00 -0800 (PST)
Message-ID: <b9287c3e-8850-440d-bb08-aa3af6a6f353@tuxon.dev>
Date: Wed, 18 Feb 2026 11:46:59 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
 <20260210113041.138430-12-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260210113041.138430-12-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/10/26 13:30, John Madieu wrote:
> Program the class code register explicitly during PCIe configuration
> initialization. RZ/G3E requires this register to be set, while RZ/G3S
> has these values as hardware defaults.
> 
> This configuration is harmless for RZ/G3S where these match the hardware
> defaults, and necessary for RZ/G3E to properly identify the device as a
> PCI bridge.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
