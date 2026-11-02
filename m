Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605635;
	b=N2UZ9p4k0YFaGs50eYOzdyLJAoIO5UEzaxevsYw3rzgysMPvgJYTPIxDhddja45OtFQW
	 O8++hx6/TlIlLqoviMg0U6KtzPqPgYxWtZIHy/4GGpkv30PaE4yt4qegqReOkJPs5zA8w
	 wcdya8fEk37N9liHmpexG9pHRac7pJA2E3t0aySVzFVBcJNTXQmWRldDT9ENx+Zp4vrxN
	 MN3pnlpwjhn/VZ24eIig9okg3i6UFmp48qOiuw744deOFUYUZWGXQqUu7C4Ms+Vf0F4lF
	 Bq709FB5XvNfYOwrEVVRYhZY9t6BOcoaizBpSD7AOD+GjaT3tamlG/oddWjqHPkR1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=b14LYTA1S9BSayGB97Mc5Rl9r5j3Im/STqBEekhF19E=;
	b=4d914iqpbIbShUQwyR3bFY2RJBnN2bE1L66ZJgYcw+gaAJ3Jreycr+au4YWXG8aqVLoV
	 Qkl2qpxom5Dw+AOmv+8M4VeRCdsKkSNfwBke+Ps9eR1vvbstQEbWXVx4sHxTXpgFwHgsr
	 5XYSxAyTxRHBroRUHKX/FkwRIo6zOu1mt/tS4vC6k2PsSF/Q3ukMV/uUtv1Y8thXeKg8N
	 s1yJHnOVLWsZVInmEOu4CXMYvHs9D0hUOSdA3R5z8oazLF2p6cUImrdTqgLUv2um1dJ5t
	 l4zNHqivx3shNxD3wjoeHDJ6M/meZgXnRxzp1ds81In4ogUlHtAcJ+ji2iCaH9IQVfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494D606A324
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 07:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3494D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so13281565e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 Nov 2026 23:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1793605625; x=1794210425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b14LYTA1S9BSayGB97Mc5Rl9r5j3Im/STqBEekhF19E=;
        b=iIEUBOrt9FAz/xBOJKXuYWcx52czJmqQYqfmNykzUjIn/tnMG8lzBZYXcIniv5onev
         LWl/ro7iSKrWTm5dOOJlWgzRQvNV0cdp8LQ5pbY+I+0P0EM+GtCwmdF/6aUbucd26V4f
         ZAg/4fajYQXicJYkQ0CeVpACm2VY2Dh02cZt4V6QSvRiRcTepwGLGc7VG/0mzBUHYbFx
         bPnqPc/1fD9mu+v7C3grCfFPzSx/ufRN6jzLFCvcFYPLmfAXIE5VOGZ8dvtwQ/LAIX7q
         iKxnaaHIUIeYQ9KLrkSRWqjYQIjLIR50eLDYi96cfZ9B2s0U7FSHHsuBKfp4BSoR8mSu
         XoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605625; x=1794210425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b14LYTA1S9BSayGB97Mc5Rl9r5j3Im/STqBEekhF19E=;
        b=z98dkyggbTj4602ed2DdjG91FeB2hcQQJ04TeS/XVpJZMmpK7afGVGWSBnc+d3p9Zi
         iXivLIZWgwh7zpDTdbbsaLnR4VU5fT8qRQjBRN2YTAKqFcr+gj2+yVWrAtM2HW59xV4C
         tsPNmoMMzIys3X5chcq+h337wImsYHYfnLT26R+yPUGOLb0GKBZMHfS+oixhtFi5zxp/
         s22qefdRi5G3OVePW3OdU9bfbSKEK4yX1o0HXgo3jnixPlpcKXvX9EOwWE+E/tEAW5ka
         XtKWSAVKR0uh7gLMMhUtkrtZxzONIAiPH4cNrAgoFHzReO649snrFB9eLhRoNYQnBymK
         wscQ==
X-Gm-Message-State: AFq9FYK8T6fxUguRrZf/uPPbWBvbg3P8WDFRmCW+bm950oMw6HckAR16
	fdaqAR4DhMRl3q/5IC7tCQAFbS5TXK0P0KQG8ZXVMsPzoggsurLhBjB8uzCdvly4TCEDC5N1fs/
	7wAht
X-Gm-Gg: AYBFou0FgFrBKHzYPQCA4PhRUUR/KTxyBF8xZ+C6IO5Yh2ZXKDA2XsRQr1TuUDEXLf6
	moglJNw27A4+kXq+DDx5lbmmwFLdAe3azQ/GK2w59ckIBpZRibjpymRsGBF/clhkcKLA73NG5cC
	6ZbvKcl40aDqN2BvQiXZNVMHrcEAexo2oeeqizDPz1V8a45LtgDAUTqIK4tPXDYyM5WyQl5SWCm
	tXihPAIRSrt0u50sbfH+540JUwb60xTJTePSUdACWr4um8vDf4unK9HeX+D4wKDWn3pxpwUyOEo
	tovC0SDFkzxwMDJENJjyHW5CvjyB6f6urDAlPe0VE5ZCQ2YtPI7KIWQBepYS4SS0akNO5O4JTRq
	OdeFsg915ONfzGKLJUBUAAhm/Nchu431MmEra+ttQsv/N+gYTqZgtGb20zssvbmbxGJkOSOtBJJ
	S4Iuyp+6jNxtP/uoRsQy8rprLaScvUv4PcEkEryeFnTdfb2AZIi9GA4IQNJnv91szMdj7w081iz
	CD9VoEO2gvT05TtyZl2yEYD2witGGE09CV7o5nLojci5IeBcJH1JMwpiPtCD4T0InkKXOxqn5rG
	VVK8aqsoYIP1ZUEMJkwAvCn+tfh62roMaE9d
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr211826405e9.0.1793605625126;
        Sun, 01 Nov 2026 23:47:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm297766155e9.12.2026.11.01.23.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:47:04 -0800 (PST)
Message-ID: <b11c5b2c-3be0-413f-8573-5f62284bee68@tuxon.dev>
Date: Mon, 2 Nov 2026 09:47:03 +0200
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
Subject: Re: [PATCH] soc: renesas: rz-sysc: Remove SYS_I3C_CFG register
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/29/26 19:51, Diogo Ivo wrote:
> As per the Renesas HW team this register was unintentionally left
> in the HW manual of both the RZ/G3S and RZ/G3L and should be removed
> from the code, so do it. No functional changes intended.
> 
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
