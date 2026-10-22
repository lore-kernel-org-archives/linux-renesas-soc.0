Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627314;
	b=0Ssevs7BKgMT+Go5Yf7FgoZmZxh3T6fkDuPhjqZZRMnwDf5sa+RSSegv28etlFzFwAfe
	 z1NqmsyHzcwDuCSUCUmd041HDAXnuWf1ycriHbOCQp//1dCYdSvhKxrx5j6nGI2jOyzpc
	 Mx0ZaEVa0A18+BXX28NSs92/Z++nGkWaDxLrf8rrgWnC4UNyCGNJSyLHpc43kGAKM0/gQ
	 rO3rPHux+CmSaeV3K+UKlCRQYOO7Fq8iRcje76iF6nyNLrnZEAOteMmSxnDCD6mdCt+pD
	 8hF1O7ALITOt/AQdjk1NzjMC9qNhkubWE23n/4UMGJLXEXPMYfsH4eJhL23jSDMhKnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O094qediP2wRssZ1brE73mgAfR6yZlb+wTlB4/WavvU=;
	b=H8xfntwvo58pnuuFhkoCPjFMpXKiOeMDJUlzqGsLJ/VZ2SkhgVu6T29mVq4q62EV/YQM
	 cttBJrrivAs5iMPZCNcZuX/mFgTe3A5BwJSMLvY04UdNIa47zGNz2zXszeh+C2CQPYqsd
	 cqp0G3aoul1aogqZB3AFdnXKmvk3ZGSaEGloPI0msgrsHMaIgi701Q/nvaAjfFAqd1v9J
	 lPSXkqVaweshECx5AcTq7sa3CUMWJNj7EYZkZ4dJa6AbUssyctXArOf8ngB51YHgsL0jD
	 MDKhSQuDmgwXGko5xrvoEL5AE7xHdgQnfvP/+7WxTUvgoEwgR5g7k4ah5c1lX7zft+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZhgsrPKU;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D271260A5BC8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 00:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D271260A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZhgsrPKU
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36661f953e4so2434192eec.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 17:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627313; x=1793232113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O094qediP2wRssZ1brE73mgAfR6yZlb+wTlB4/WavvU=;
        b=ZhgsrPKU4LMXrrq+6Elpeq2DpLIdDfd/eNM9DRANdago8lMKwnsdDh0mSLtOw+1A+B
         ic3OJYarLxbxRtaozaAXYSLAh2ZnILBpZuCBVWvUoH5hUHeCY+PKP6+auDMbJvtYuHOZ
         IuK87XGlpA3OKuVwA6bLP4v9MpH7QRvqZ0RJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627313; x=1793232113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O094qediP2wRssZ1brE73mgAfR6yZlb+wTlB4/WavvU=;
        b=lkRhu9SRHmDkPNHLXbMmDf4QN1yyOv6rcEA2B0fyDOPueO9ayerJX9mR1kMQbJC6uj
         lP+f+1fPfHuiZ8eqBo12YwQytrKj31w/6njPmxPF2w/57sApd2w8LDfY5fRbLyhkHK9d
         vt1gkVFvd1yk8ONAIpz/M2fVVnaWEKDgrA+DonOcXA4iZA+nGz77p9nmXJsdInBQ6K//
         pN3Y+i9J1RA5BdfGCtIQbfT8NPTjZLVcrj32PMWin/KkpORffRqT8KKC5hGc0cXpcL7v
         W/vugZ8IvmmmaFtGj3rzTuzR1838lMZ8IOqDD2X7/TfkiqI13X3wk4eELJoXgFUOk2Nu
         tyIA==
X-Forwarded-Encrypted: i=1; AKwUvByGX8RrLxFN8E6FptCsQtKzfOQsPypmkiUobBKGgZhNZ609FI9Mk5UYOlkmIR9NLWmkQtLXFFCj/eEyjt1IV28lBg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3SYjcyj8kuPzJfOqqRrDKzQZ+Dr0/xkbWFomunFp3dfEJLW2g
	yRV+k9nuK3lyIu3weH11V/ec3wx7UCW+rM7Nm8n7REx8vRTSG33nkRln500Amjvqlg==
X-Gm-Gg: AYBFou0B4/4eTs7aCiG5dunVYJvow4BQMi5/SkdTpEuTNNHJuc5nJIRZrOKvTGfkPVZ
	hjcTbjYEo6lOdSOdn/6wMmxqBf/UeZtr5lQRnF13ySDVHMkeckuqPTwFL7tPcp6GBfu/MG6sxDu
	/Oy7LuxIzWw6CfYpK4m3h6kdUbgcPBeGjiH3IN4CzUkvp1e27KnnSG7ixdUKhnXIylxTh6IeHnS
	KmozdubKzIxmbzT1DbgD9AqXiuswMAlju4v40YYiKL4TX0VYd7SoqvrjsM4Q+edmEL7Aq8Vwx1w
	XH8pChzAjpUvSjpxMT31gAQN42HpIIfE+IG5qdjrJ6O6KW9k6QcfO4IN/XwLpAuvia4LjKMgFqj
	YgktY6X3ETH57bLcf0uJXE0MwEb7e530tSTxqzd5PG+eiBwxELtbKW00T+DkfpdNbP02b1iVVHN
	fLeZbYhEIFdtvSlrUj53VzC7WS39vyo+uwxeb9iuVAFlPbYsawy/IIPfizieWOTdmRq0kkyY6Gd
	xzbSq9RkXxX5bkXrq9L6YuSEtCIwY/JkueFbyZnOQhiw0Eqbzj/OSvaKsbVh1Kh1oHO52xYDuXf
	bXTYpRSSMYkiimeDQ11AGrTMafs02oQ9q57Cl9C0
X-Received: by 2002:a05:7301:4005:b0:368:536e:c8b9 with SMTP id 5a478bee46e88-368536eda38mr2638548eec.26.1792627312863;
        Wed, 21 Oct 2026 17:01:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36740cc8c6dsm12073378eec.12.2026.10.21.17.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:51 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:01:50 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>, linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/13] iio: Discard pm_runtime_put_autosuspend() return
 values
Message-ID: <atlSbgGb0kEEYhao@google.com>
References: <20261006231900.3230373-1-briannorris@chromium.org>
 <20261006161337.3.If2263e6ae9eaa4493881b72922dcde031ce9d81d@changeid>
 <20261018211807.66bfea0d@jic23-hlaptop>
 <ataTYER7XM_MEYKL@google.com>
 <20261021194951.7b65c2eb@jic23-hlaptop>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021194951.7b65c2eb@jic23-hlaptop>

On Wed, Oct 21, 2026 at 07:49:51PM +0100, Jonathan Cameron wrote:
> On Mon, 19 Oct 2026 15:02:08 -0700
> Brian Norris <briannorris@chromium.org> wrote:
> > Also, unless you'd prefer otherwise, I plan to wait a bit more to send
> > v2, since the merge window only just opened, and some of this series
> > will just be a RESEND. I'd prefer maximizing the chance that the
> > recipients will actually notice the patches, by submitting outside that
> > window.
> > 
> > (OTOH, the bulk of these changes are in IIO, so I can just make IIO its
> > own series if that helps things along.)
> 
> I'd split out an IIO series but take your time as no particular rush
> given these won't merge until next time around.

OK, I've sent out an IIO-specific v2. I'll resend non-IIO separately
later on.

Brian
