Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771054;
	b=G/ffAuguCjKzLofTiY1bGngV+XYd2FZlPjT0xgqnlolO2xca0zDNpABxzHOIr4GjWUI2
	 FH9a4LR+EvI7/yQO5d/JpYQtKMc/dbWGUFuS53ct8EN5DvKUI6MWhsHiGtbNI3qD40Wi4
	 eEW3HfJiL6pA4Xb2uPz71xbJOQMjMNlMtBpkMltCA03gyQE3GghYrMcdwDW6Kk2+a+Hmf
	 lGKn+8k+witnlzlqPzD6AHfteO/EJYFPILic6iaZyA5fTefU837WuRlOk7R/9PnZSsYBY
	 9xSBw390HiJbhmlejobU3Tk1VUXoPuUghsmTcod63C8/xSgjLYT/Xj/lSYF/PJjDeYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
	b=ceBpohhLyHmzV7b7dlfz5IsyzsdDmAMMwA/Y+YiRmeqS88cFtv/r/aN2rlgZ7H6TbKcI
	 mjb7lg07OCi3mMlEBlQARYyuIhycoFRX3NeFvIiKC3UJOM7+WXbwRGjM0mJCFMhZAzPCN
	 49NVUdVgoIPqLLRd8Cfi9WYCduT2+B4sAZRisOdE/U837Odi5/FweiMTSGkpysw9V/P15
	 n8hm8aJEilTe7QaqWlSYqiV8qDXf5rXZFkRHloBslSCxcbzmRdZ/smbjNzaQysRaxCjYT
	 O0NqXs4Jwp7JQ97ZqvkKsHQF/FI3JAQuvgrmttAH9Cehyrh8D4JX5RJ5HhfQW3coEcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F43606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 09:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F43606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so63899805e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771051; x=1796375851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=aI0lqB3aCQ/4qBvwVRrDv3T2pKd7GIXvwQaW/Zh+LDPEWa17gOnnrr1BRlBIiBDLGi
         3xPfRxJaZjTyG/xvFc3dneK3xD/vNNrfe7lzCHKDtGApXlb18j3sVqNfkNpyZlK6n953
         YXQWqBLq6DgnAMebNL03Z+0dRUS7k1lzTKtoLXWxp18A2ag/Vuu/j9v/pXqDglpge3+U
         0aSVeDRd0euIBB0pClkJqh+3k8ujN4D7hiwgn+JHi6wQmvh/EL4Kk4CFcoCmmj/IueNy
         dsgWcm41bUvXD8zNf1yL+83BWKY+VC6T4IQuzt9lZYBAlNR/nIKXUaaUworjOtwk/D1z
         Ktag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771051; x=1796375851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=aQttdchuuUjYQnMIwcPsC9C+x41UA8l3Wsv/hln0BU9B7isbji6Xm451Vi5hK3did0
         wOcZ0fGESwLcbgju6zmXyHXXMyIRAm3awpe3mgM6L1x1j7ENlG9s3eRnUrqffq0GhHRi
         mD3i0KGNpNbLKTU4VvmFlLS+bDryF5CN+9dXkb7uJ52MPUhMK38DzN/Dek4B3Y2UH2W/
         70vg2xirF8OwXEPlpDqCD0vueUO7jJ2gA/6lKhMie8AiJCiWK31rQU5kTihRay5WHckl
         wGRIfoF+3mhZDDwNiI0QiwxjrKrb6avMbSuoVozpNqN9isIMEfy3GNKFnNqEkNrpD/C1
         u3Ww==
X-Forwarded-Encrypted: i=1; AL+hErEsyjxUvjrcAAohZxU1d4PbZCZIvg/dCdWzEhtmZNSmYZ/bDq+PGJUnUluQAq2adaiOC9EIjVyXMMpWJ1iUtycJEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9pWQ635nfn0six4zBXimEbNdQ2c80IAzVjwP3iENUXTEST2lTs
	3c2nLjTmxA18/g4vgT1aDmIg1R4yX26tDzlli9onUR/vdynzP9CddLpFG5QYVO9kCHE=
X-Gm-Gg: AZFdTZc9872wm8+0bnU+aVlx2+yFMWhbqlXeBtl05ZVqJGa319nqsIJIJ+nfqEYC+Dx
	1qr26Eek0FcsfconsEdrt8eYa7WKRELOO6OPADEAPZAvlNLSJB4rFEGUKTqhRjgnlV1AO1rCyK7
	hhCfrN1EJR3J8g4jMZ+VOOpzmUDzx7f/ZhbGFV1t5XoqpHfDl6NNwyvkZDgDWeHLHoGQV5PgOAg
	LdvrqTtdxgkpgt2zVXcYRhe5HqWHEEodf5Bmq+jtMbCMeWu/v2O1YchMrE5IICv34XFIxG1X5g6
	N/FeeVnxclnoZ0hjUAnNvEKEvREtrkx/h3qPaqDOoMPoTF1v7dKIzMCTvwHzLZJOb6HUEduc3pi
	uZ9W5Ive1+FdBQITEPiRe80xCPRZ2VQ8jO4XnzJpQAZofTNCe6yjNt/li9XXzFLPqR3djoeUaPv
	4a1+3Kc0UZ2MBXT+i9m3P3Sq9744KflWNPnTOJ5LVJ9BAvblLu2YlTiwp53oX3B/nBSFrSv2OO/
	QZDVhxXzO+CShLlY0fSijJvwM6uvXGRF5frHPZrsi+iV32icZnSZDPGKfwgnOqLBy9PEdmJAbX5
	wBZFQRna+zfNaCeSWp1zZ5inl7d2pzoik633
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr438432725e9.9.1795771051464;
        Fri, 27 Nov 2026 01:17:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm896151645e9.0.2026.11.27.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:30 -0800 (PST)
Message-ID: <5c05644b-fcf2-41e7-a012-338ce7eec8d2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:29 +0200
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
Subject: Re: [PATCH v2 2/7] i3c: renesas: Drop comma after OF match table
 sentinel
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
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> Reviewed-by: Frank Li<Frank.Li@nxp.com>
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
