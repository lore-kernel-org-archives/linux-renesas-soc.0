Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770731;
	b=YqNEBDRd0soIQkGDMGBBwpkZHPsO0c96WPTDAEeKIBbnOVvjomMd2u/aOmJqiV3QDgig
	 PVb+zGz/d1u1rILWt7fCl/81um/JqEqvlvQCpvzmFqBvh1cpYjgd7HH4mUM/76q0lF4SC
	 fcd6hAdhkzZU7z6Cy/PWB6B7V+jBUTstdaWU01MmI6+7HxJOgzlfW20V3+4F+sX6l4ceY
	 jED2aY/DcUwt5dtcR878G9eOaHywUYnr/JnPrKVUzr1ooVWIX8roq0+VlNqHWvwY5VuDt
	 S8igzPF2b3cHHD9x8MD6+KKSBQwVapx+B8bPg/xNEClRdg1H9cn1T1wt1XMJyaZgxKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7BmBlqkLTRWPnM/PyPREkTVAoRCehz9jfOuEcWz3kOo=;
	b=vCqqxZkZfz3mJRW0wQ2Ly4SDRoF+Dat2/5lhn3uN/aXYDEx1DqGJ1bKKv8khQyGs17sA
	 iegId3aqntqSes4yZMCvxqPHEdO9UaaOFdO0f+nDmLyFVwq3XR3cEoyzf7txcQ8cTdZ4R
	 3ahieNRuxyW+GLE5mRdwPAKlsZL/aV/lUCg124g9/J5+fgoNaCZ5qT0J2/Rz7cxEIVbXP
	 2ctzCTwqwqGT9vwcn02lYw2cBAK8WkPR1BP8LEDT8IS41kvYBywBU+U9DfWUPIRF554Au
	 0Q7shJuH+ZDUPQ16yg3eKPB7EJ6k8fA/w54MrKIV89q28YYiNp6WLxqbjKuyHro87Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=oUQtFPfH;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39F6606A335
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 09:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D39F6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=oUQtFPfH
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so8174552a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 01:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795770729; x=1796375529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BmBlqkLTRWPnM/PyPREkTVAoRCehz9jfOuEcWz3kOo=;
        b=oUQtFPfHi1S6G+Lki3MzTQU86GQHUmr/a7X4kCX27BKxweK2JCwd1auoyJbq2h0HbQ
         3X39h5pwxHW+tWps2o0RFgepURXxk1OguFJljOt010jDjXDrOO1KYqKijW6maJ4sEbev
         tUnLjv2oaxOPj3/4XJIxCN0BsmJHLBj3y498UFTgEG+GUR1NLsWSZv1YE2jdesVVwF2X
         tcMiitjnx+V+w25x/IEB2KldSyjntkjyw5NTnEXwkCcJzqLKfdDj+NAhE7Drx6lWOcw3
         ySVBQGUMXO/Ai3k88g/5bXwZVH8M+9vRrj+4D6Ai4t+p1be1gvN2P7nhEJebNOBW/HX0
         0cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770729; x=1796375529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BmBlqkLTRWPnM/PyPREkTVAoRCehz9jfOuEcWz3kOo=;
        b=EJkAHFR78ZAbQTBnBZ+rPo1+GKQnMiz5p5gyPrfgWhb1tYZYYeoHmlzrjMVEcjpSEF
         aWSuZk4FMIZl/B58npU56VUZxUtoTUjlOFywdci2O4+dim8FCufBmmXmWZj+gpLQ7FNN
         AI8KgIOvZO3c0MaNX4PLKijQl4gdGaFLnPtlZ2W4JSgVEmYhRcI7E+ZgJ4FNIPXT6cJ7
         s3Sqs3W/MSjJy7R45Jf8aL2PogIf7RDH/i7UZPoXWC7NJqc5e5CiogPF5mplORt69zVf
         jcB2xJBZHjFiyYyV5PLZZ8SUMeFFnAN+63SR88sZXDy7TXQrsdTAoOMmY1pzI+hkSJYC
         esKA==
X-Forwarded-Encrypted: i=1; AL+hErGCG3TbPmRC+Bbgv5Y2BqRvsu5UOFDHGYgDd91zmQaHmVFLOhZws+ScVto5z4Q9ajZzIQnBP+LgAsaSgL6x9ukrig==@vger.kernel.org
X-Gm-Message-State: APuU4Z/apt3E/2q62M8RAm/Yi1yd5QNepKHDeNrvgdLawRmGIWYGwdxX
	rFdngEjmQMdGxCINvzSgXzqBDwBBuQPGKixDixx8OSeI7oa9U6psEPP6bkFIDTz+0UA=
X-Gm-Gg: AZFdTZdlpSHZbiZSCHBB3v/17W9IYz7TRTX8Z80a2trQzaE0cv0tVeEoiGeYp2FTLj5
	6kU16tkXA6VQNXLFbcZzQNlLnYOXM18ZDgh6iSSkaPRmC74A3bnjisoNhRD+wUUCs+fL1Ep05is
	Gom0VyXQDmepojMrRKMdkS7TWa7IZDyyTvJ8aFUVchpXNlmxbxDXJWt5IM5jwfX3Aqeo71J8MIQ
	wKXGweK0fMwTIlWW+LXs4zYQ2Q0+kXpqV5Vh5W3BG4Lr8PSDdSsNdJBN6RsmQ4HZQEBogWcZjtx
	6pRlsVmfmNTsTam4a1bDtzbIyd1pKsWwvgRclwxM1JFESNw90msx/uPwWpVJezJbe+qrnMgq+vd
	16D/uTVP3M4FMNt3ZdTl7aEDqV1BQ8xg45ya7Q93oox9yiBniuZz+xb3VuI1oTrdmqMpMDruslG
	FahvBf9JeBA9b1G659i9p1iAh6bH9lq6WXaDGtdfi9BRzneUTHv0lSzeDZHVKSstFCbhofwVuXG
	muJL6sOJSetuVQbL7FmpZMOyoFKovRF1//cxkNpG6glHgz+GMnS/m5MRK5pUeEjdEKztzebyU9h
	BeqtVY8jUnhRsqPKVBBq65N+Fe7lxzIxhzSs
X-Received: by 2002:a05:6402:13cb:b0:6ba:4bf3:4a2 with SMTP id 4fb4d7f45d1cf-6ba4bf305c0mr15740801a12.17.1795770728948;
        Fri, 27 Nov 2026 01:12:08 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm43017556f8f.18.2026.11.27.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:12:08 -0800 (PST)
Message-ID: <bd8014fe-6a77-445d-b73d-e87404638593@tuxon.dev>
Date: Fri, 27 Nov 2026 11:12:06 +0200
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
Subject: Re: [PATCH v2 1/7] i3c: renesas: Fix zero I2C SCL rate on pure I3C
 buses
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
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Diogo,

On 10/26/26 13:35, Diogo Ivo wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
> 
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
> 
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
>   - Substituted if/else with ternary operator
>   - Picked up R-b from Wolfram Sang
> ---
>   drivers/i3c/master/renesas-i3c.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 8b264f72e55c..78d0a2c4a19e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,15 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>   	if (!i3c->rate)
>   		return -EINVAL;
>   
> -	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +	/*
> +	 * A pure I3C bus has no I2C devices, so the I3C core leaves
> +	 * scl_rate.i2c at zero if not explicitly defined in DT. The
> +	 * open-drain SCL fields of STDBR, which are used for the DAA
> +	 * pending read, are derived from it though, so fall back to
> +	 * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +	 */
> +	i2c_total_ticks = DIV_ROUND_UP(i3c->rate,
> +				       bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);

The manual (at lest the RZ/G3S, Rev.1.30) mentions on the documentation of 
BFCTL.FMPE bit:

Set this bit to 1 when using the transmission rate within a range up to 1 Mbps 
(Fast-mode Plus [Fm+]) of the I3C-bus specification. Set this bit to 0 when 
using the transmission rate at other rates (up to 100 kbps [Sm], up to 400 kbps
[Fm]).

In case the i2c_total_ticks = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE should the 
BFCTL.FMPE bit also be set for the operation you mentioned? If so, maybe set the 
default to I3C_BUS_I2C_FM_SCL_MAX_RATE to avoid any further changes?

Thank you,
Claudiu
