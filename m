Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711745;
	b=YqvixRaI/Fod2ws99tcR793TpCFVEy/4pLFO2x/UKacfOdu0zXJuE7pt4IzEUMBPEwEf
	 gX0Yh98jHgDoPNCSgQAe5XF6tUBxFLdbnP6XsBN4/u+nkuK7GssUrv7rkvOVUCPJtzcZZ
	 M7EE8ZXpvU5w3r7VhhjZfVBPV/eTSkw5oSQlDzI8PMlVEVL/GN4okef2kHWTN+nsxvik4
	 0T9viHO5dga5+ZsZI7RJn3pdOhDijWjUErx8Lvci+Fv5+J9j9iQKu/lHjkXyAbjqYHA1C
	 yg4IMqYq4VP4U2f5QGWinXIR8/9/vU1qaaF7IDqrM+USyWIvGoDVYUr9LbBlSMFx0yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rzDnp40CE+pREC32cu0fVxrG/CaDJAbCUC6G5UBtf1k=;
	b=rNRgLPGMb757fFVU9gADmvl72vdWXyfWPDxYPJkJNeU2i5wJkj78bXkbY+DIf+6P9bI5
	 bnZbCAxkVOfL03k998nWcnh7BibRZKO+bljMBqh+7Yh+1HR8ZO+/spdvNV9oMtViRAu/r
	 d7PElRx9e/L0c/9+VqB+7kMozOfAHlWLx6AUc8pEKX8RZ3uwVcISJsY4As0Mx+pCJpgfz
	 g5v9xCtMHWVxxPqdAh5s3eCslm6tfaIhvulkB+IbqTnOMgIHntiTStSEzXsHt/Vc13SQ1
	 DbV/S443wpuaFkVaVM6sCq6NZCiCUg3phw5SN6JViNA33XMqc39lM8+ghYWO8XBm1zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Z+PAYiRo;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19091606A31C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 16:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19091606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Z+PAYiRo
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso56672045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 08:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795711743; x=1796316543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzDnp40CE+pREC32cu0fVxrG/CaDJAbCUC6G5UBtf1k=;
        b=Z+PAYiRobNheQwZbfb5f7QnQu49d25SfmVyFqoPiOKNsJj+kKgYtX4MJYBi87CehJz
         jYsCk/iNt3mZlIJS4Nt/63q1faPRJEGPLekhja7Tf1hTGuPp0dle1UglF+CV+SzD0VJT
         X8Hkl9tjgLa+GkYtXcP/J0W7KyxRIt88GFlAYWwyvsqHluwqWYXn8eabVGlHz+QwDlac
         G07/avkpNPctUrH2sDvpcAlRqmhwNisEPBzFxhUqWAXhnLvbhi4HshA8USZgbqdNbLv8
         pu6iUDPxhOZDlfr+pAtoisZDkzbhLW3oQANqE25LjsYP4NYBYn+mrD7xJrLajoQFP2+W
         SlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711743; x=1796316543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzDnp40CE+pREC32cu0fVxrG/CaDJAbCUC6G5UBtf1k=;
        b=kOPatDIYo0tup/jmQMp6fEiS4XAT2yCqFTyx6Z+x+GNEm9MQrdnvcZeVcMDrVO6Hez
         ICE0hdVPRtISQdHPxiSova9wVckUvBW3aeVW67/mWesoM87s+YrJ2GZYeVDWZ6UM23kg
         bY0PoLXkovMdyam22IcZ9kbjSSZIy4dhkZ/jR4SxKeMiMvS9xlrO965Hrw5TkuyK4+Jq
         aYYZQGuaKB1eg3kppeMHwdYSoxt0rgnOGxj6w0TBHX1zAhOH3KGixjPjT3OouW0CKqd3
         tLhjfTFz9KK9MQyIgyRBZ/ihkaDR7oTd2AR9xvXjYQNQQWUTBmzoM6ujUdLbmwdq0o0D
         Z4CQ==
X-Forwarded-Encrypted: i=1; AL+hErEZSLXgtUlUXuk/urJiFvLaTIh/fSirJtGoYT8CsRjUumpLJGkkAMbiGEz+VQoAl5QHmqyZEOcPcYo+JxjxydPx3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8liWPfAnDnnIUbbplrIy/QqKsXIDlLWTaz11JtsaGoGO64bBMl
	kriJMuy5+nf6RVWlRY870PkMnC4qIgmEkBWXNVbw1zHmOYv/MXfTlRSA8ZnimVqKbqY=
X-Gm-Gg: AZFdTZeHw/H/IlIbzJ5zAmfuIET4VopNpHMC3Du9RJ3qtSc0KuaqFwzw+QVAuGVPsF2
	S5bkwccPswbuCeQO1CB7PO11cDqsOKbI1xxUUhEFDTBp9Dwky38m8ByuOTlsYU0pG7kZSW4Xndp
	mb8EVDucNd5EiUmXExDLUWSYkTl72OQGQER+Ps0XD65IiIsQvHBR3tlY5uB6gF2BJfBxhjhTKwN
	/rlVJwfPDo/iLvYe9yKQZOqevs3Tsu4ZvW6Tq+aHGA7vx5iqpIN5ax/W4s5eC5jxcTg11kwdeb5
	wK01RgtegvglPxdk+DW1LsLLNR+3dFgS6SXYRL1fz8mxfEieyXcqW3Jl02oEo8YYjGSsw3RdCCy
	H1AMm3fsiE0Q3AuUzr8fKhphtYa8ZBhFleROzY5vz3nKKtDaVtmuE0zXIvGKkmmpA/TmTV4+NqQ
	axhZLVF7Q5ihFpWH1TZZtzFsXcEKtSrBLxZOc9UUx9sG5JHyNj1hd2mcRVZlC/FYhWIbMkJG4ws
	2H7aLwQ8eMjTvcyPxaEguW8jdDpKGzua3HqDMxBb+C7Zmkiiq93YoujMPu7TcHsE9MwdwqFP7hg
	VSqtsPEvjRacpmPfWBiOac3Sojbw93JIt4yEM8r4frEGhQnTH3P+zo1fVQ==
X-Received: by 2002:a05:600c:4e0c:b0:4bb:875b:f23f with SMTP id 5b1f17b1804b1-4bb88827f0bmr417736165e9.33.1795711743379;
        Thu, 26 Nov 2026 08:49:03 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm43506290f8f.8.2026.11.26.08.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:49:02 -0800 (PST)
Message-ID: <54b84f7d-163d-4cc7-8ae7-0bc41f48ae1e@tuxon.dev>
Date: Thu, 26 Nov 2026 18:49:01 +0200
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
Subject: Re: [PATCH v2 3/4] can: rcar_canfd: Make clkp local
To: Geert Uytterhoeven <geert@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
 <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <cover.1795703576.git.geert+renesas@glider.be>
 <72de009af38868a4c72c0af674e2f527035a2927.1795703576.git.geert+renesas@glider.be>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <72de009af38868a4c72c0af674e2f527035a2927.1795703576.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/26 16:46, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven<geert+renesas@glider.be>
> 
> The peripheral clock is only used in rcar_canfd_probe(), so convert clkp
> to a local variable.
> 
> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>
> Reviewed-by: Biju Das<biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
