Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C046AA95
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052668; cv=none; b=C6RW5CVjbtjWDsgv/2Ao9cjV3b+PimwVlrcTyqbIN6Ty+hNmxjmjOpaoL1vrNIz//LXxftTwoiWL5cOtAUoMib0FxFW8EE0txd/omgXXofGaL6B+QVKLk5L4HIO11ggXD/dAiqMfv58zwJIbXehdn9Ynn1HuYvlSwH2OdAJ825I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052668; c=relaxed/simple;
	bh=34Tk8hFf2kmRMBjY2LDB8H6WrFBwxCMdp8HtQJlrF24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pw5pqPB/Ic5adhGvrh/j0SGCICj0tjtVrejx40z0hUJp9jMsZHYc06KDcmvp8nu+IPHbz4TMaEZL8BU1dWOPQ7jqbPzr5kAcGEZJMlxg+m0xwdJYtU+Wyn8vBM2FFW99gFDsLXu3Pg2r9aIdwrd36BKrjV4BkMusYKw8kHi7Y0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BFG6MyN0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BFG6MyN0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2979185f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787052664; x=1787657464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzUhoMzeL3A3db0AUGhPTEVPs2wp/05yY0aTmKXk1EA=;
        b=BFG6MyN0Muz0meok6YmouVSAlvzC67kX/ZV00aJNBXUKLcK9yD4amtBelxvPxyZKiY
         fITYL+iGPBG5vuRWglVAGUT9miBkALEsA/nEPPOfxWSbWjpaKM12hAQFvROvqrB75o/9
         APLrF579V0PspvENvn6IjUxXKZ1L7/4azd24KGviT6WtjidCUshk48XBfahq2PW6bmIW
         T6og23XktrZoyTPjWT0k354AFmDi6kOMdlO8QJu5Oolm3xdKbku7UdARVEPcpPDbQM0F
         VSb4qbBK7D80AEC7mvgAevm7WLeLFnIh9Raqs6m9ahOD3vqYX50NH9Ab2doZY79lhqrf
         FVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052664; x=1787657464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzUhoMzeL3A3db0AUGhPTEVPs2wp/05yY0aTmKXk1EA=;
        b=GNJY3s6epgF1q2IzdmNpwGEBqGAA+a3pd4OES6q89t84oWjT5yzWcMBSxrIyprJwvu
         9ZkGSvrVieZIi1R/lLxcqMhkEfKFlwkzhb44/kZhFhuU6ePCruXTkdAns7sjwQS7/2Hy
         BACcWgjbk5gntgv8jB7PGCCS6Xax1M9QxhW1j3DuAkfQHJ/464p7uVq1xY65tioqwdMn
         PCaNBuH6eZrPgbUSWtGpnivcmi/ar49dYzsYiufA3LIUZnCSN9x/23oiZc5O/X42dW/T
         NXnqoHxaDa59F5EPkSEINO20KhLImN06RQztU9TB24VV2teTBwr5sZBS6LJxNGw4a8tE
         8mjw==
X-Forwarded-Encrypted: i=1; AHgh+Roi8AdMYZPo0GQoLyAyApy7IKhtJZ9Djak/JHWAU0OrVKiJ5tu4Y76mZO1+78ldwHoC1pI6un5KGMq2Wq7taYtlng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLcbkBTuyk+hbV3cwx9wd+IJQnJitssGlVJ7ZaouUSsKBCoWsw
	FEvLOfwqQcDYjh28SkKAGEam4bfDmtpucD/I7epFSbRgjzW+ltfDXLAJ6cGw6l5zBKg=
X-Gm-Gg: AR+sD124FIxCrSPnRGg0QE5G+qnVLZx1hAVLhDojNHepJciTFoJYLWbfkgIVsWjwcBF
	bGuikqWRmnW8Mos7pC8PbCaNC2MwJu2o4taJujvoafhmSyVgzwEJAdC+5/AT2zA/A8qYs3iPKmD
	YwcFFDSNHGlXx1gj0RwrlNKzqVFWtNfP/moaMeusdrWY37HCDoiFwe2RpOIx6UpwTy+EmkqzDpa
	xA9B+Pr8ccbzZedx73soYF10oTiLeMvwJK/p4hreRYHfGeRHyyHoeoIGqxg5jMniEBRDv+dLooL
	b77vnJmhSoahtOUrlUdwcVDVb7Y8g3rpd3OEEWYtI/+jffjV2AqPC8trOEnngEYm+ZmI2gI/ccO
	vJAQzDXSx0NDgvyCypIj5crVRNeSIH/HyGIj5kFcrUwmgqUAuU+311mQbVoZX6i72x62wRViVse
	nztSfqKXkLCreGEw/04g3prW56syLaadkSm5OYu12xFFvholb5qrDbdbOpyew6k7lzkGkW5tB83
	2M2gc6/CpUNsR1Boy4/pNF8pQe1wl+YBOim8jFtpCxY
X-Received: by 2002:a05:6000:41eb:b0:47f:91f0:9a8 with SMTP id ffacd0b85a97d-4816079ece5mr60246879f8f.23.1787052663977;
        Tue, 18 Aug 2026 04:31:03 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6400:1700:1386:b860:6632:a42b? ([2a02:2f04:6400:1700:1386:b860:6632:a42b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b77f41sm10674828f8f.27.2026.08.18.04.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:31:03 -0700 (PDT)
Message-ID: <f29963f3-54af-4eca-9122-fe757c00a90c@tuxon.dev>
Date: Tue, 18 Aug 2026 14:30:58 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, bmasney@redhat.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
 <7533fcaa-c676-48f4-924e-bba9195d4871@tuxon.dev>
 <20260817-tricky-monkey-of-admiration-3caebf-mkl@pengutronix.de>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260817-tricky-monkey-of-admiration-3caebf-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Marc,

On 8/17/26 19:59, Marc Kleine-Budde wrote:
> On 10.08.2026 16:00:16, Claudiu Beznea wrote:
>> Gentle ping on this series.
> 
> Who takes the DT changes?

Apologies, I missed to previously mention the merge strategy:
- patch 1 should go though Renesas tree (taken by Geert)
- patches 2-6 should go though the CAN tree
- patches 7-8 should go though Renesas tree (taken by Geert) as Wolfram already
   mentioned

Thank you,
Claudiu

