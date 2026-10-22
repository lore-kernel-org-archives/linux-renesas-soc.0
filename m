Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691259;
	b=l0hsDR2AtmnoTcmol1xPJme9nBGPfqVcyLwGwAjpPInsPSVmTniaign0iHV6fkZaNxjK
	 Xidj2QozH8xD4mBW/OS4IVgw+q9GHydgHjkbFZOysjeVDgkHbcF699r3AolTMOSDHAipV
	 UvnmtnV2Rby0VVA0vOgB5FBVMoiB/FviiERwtwobYHMaBoLG7S28IUfQr1aaiDVDY+BG3
	 y9hdShWUg0Z1JxZCp9Gh8x37yWM2e0mlTPRSDo9JQKB1b+XdJdMEZtsFBemwcVapsB5TD
	 b68nk34jNLWOYHeQEvCCdGzg+GF02MTHiyqQEcViZoS+5YHwudDlz7hd/+3OL18tihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SCWBGn+DbuJPekfhEu4uXLYMGCLHZ53aEkUTCOxglzU=;
	b=KdS5kPvhqpuvwUzM86zOIRc+bcOb+EN0v49IwmJ66M5TAZOjGBtnx7nkp8CW7657oUKc
	 Axz2rpE3Aq4CJRFL+I2ozeQJP9/EjnProTZHeg2KD8hL4KA2DijB/KmS974/MQLd/N7+b
	 +GhMk8+z2fi3/Y9nNQuMalN+fUThuijDkIEr3hnYzgRgqoYpDafWVHpP7LfsvSLGUELU3
	 JAbXwEacjfYL/fpfoF2w2GBW98gKhuW+NtBtCaQvWHcwV0yqoae9J5bIQUNm8QkJFu9xZ
	 0Pc0Tv4igVcCCQpoE0HqeNbpXj7m+39py9SFPa4brhxLgtAzKjuH1MKgwjeoxQw6WrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RRvkm1u8;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B0A606A31D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 17:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B0A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RRvkm1u8
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so30833c88.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792691258; x=1793296058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCWBGn+DbuJPekfhEu4uXLYMGCLHZ53aEkUTCOxglzU=;
        b=RRvkm1u8IQ2Mlv0vsEHcUE6HX3QGyQ0zuC17cFWJH5zKzqe8B2RbjaeRf4virWKdfi
         BxvSMALrfPAT1sQvmdnR9hn0E8NkF0DPFeIIZicEO8qpgQ4YIQGxDGKxo0a7LhN0KIAb
         qrpZ4ahpNCVhO8d1q5QeFzajGWihKNT++R1NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691258; x=1793296058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCWBGn+DbuJPekfhEu4uXLYMGCLHZ53aEkUTCOxglzU=;
        b=tMjXAmlX+tBN1rGUrFPlyILCu2rFU0w1LYO+nKfJNRv+5tIHmfXqV3GmDA3qVPDvRh
         lm+f1yvVwYQv+1VWyl3oIYbMh4qw1kp14cpB80pff08Iio9ijuBwrGDy4nhLbW2VHiwv
         30o4L01y5titR+OVlUMUXzzW+MXIJj4+j1dD08JuEao/TyLzFJiQDEYUxDw6vBX/KB4X
         ZwtQYyTXD76X3IVLkINaN5EDMXQmlEysyNYHsp+tpPnJi0dJjZuQpSiq9c72N1qBhvCr
         +pRk6fb7c/UwW3vIbvHB35uOTfuPqQIKf/ppjJejxLWEkUDKH9Y/lGFvQU6bEM0hNZ80
         Mt5A==
X-Forwarded-Encrypted: i=1; AKwUvBwuDYhUJn0KxoS7IvDTA18Iq3ExT17NPMVxunfyXs7eOm01NYPZRpCSKVKkuu2LjhJTe/Mr/A9jLJvoXxi0u+Zylg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbGZPl3UYlVmL5JfN9WYfu+9ky2BSyR9wsoXRQEpuIPk19c4fX
	xu/vEbGAtSJqymPXrki0lEnBF8FlBVvl01hreTEJg1cTkAyI7v/0yKo9NVoGCsWFSA==
X-Gm-Gg: AYBFou3dRh3RyslESkK36xcE2KZY+DIxq8lWq4LmJ4aasvCgSjpX+6IRY3lzYnJ8f+4
	wnZwG2aKQTo3uOAQ59Ds08+Dvo/iNUk9NDUEmTPXH1nvXt8fvQQMsadGPpQPvNuehsA35Kb8iJM
	dYrTDPBVrfy2PnekuqSwDHKGYaysre13Zqq8gwIpshCOoIR04zyLjwPNFyrHTKJs1fn+gwjNtqe
	YBzNdR/3C8W5tuyDnkZ7WewnZzJaQuMn4KNOfJvrZMm6u+OO2YPFh/N0eosGslHJ2lgwuW7eHnV
	s/kOGzGVTUDV4vJnhbDp+seGE9G7YSLx1yjLmdj3bHv1fuGTJon/UmN+4U2A3s3VQb/JdM+84j2
	VI61ysnK1NnzpL9paAcjPGDqMIdkhOwSr90W3ToxGI/1k3oB0n1Y7vypuDJSKx+ztu6Pb/gQEWG
	3o7AOsaOLo5+e7JOXSqGcIcdh1cb3+EtyTXitGzVeBnKNsNBEJX2TwN1GwG7oyTYXTWbzsmY/tv
	nATh/qhrKeAM61vfKZQPP5StFKW1B/eb91HzcH15DFVlsg1yUO4kWu9I8PNmgz5Y6h0KkSVkWat
	SgdGqyewJhBMzz7ztGs=
X-Received: by 2002:a05:701b:2608:b0:144:c127:dd1b with SMTP id a92af1059eb24-190a7f02797mr6894593c88.39.1792691257861;
        Thu, 22 Oct 2026 10:47:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4a1d:784c:3fc4:37a2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-195a7f4432asm146724c88.6.2026.10.22.10.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:47:37 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:47:34 -0700
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/17] iio: Stop looking at
 pm_runtime_put_autosuspend() return codes
Message-ID: <atpMNk6ymCpC5BL_@google.com>
References: <20261021235818.3059519-1-briannorris@chromium.org>
 <atm0umwtxZlQSAhy@ashevche-desk.local>
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
In-Reply-To: <atm0umwtxZlQSAhy@ashevche-desk.local>

On Thu, Oct 22, 2026 at 10:01:14AM +0300, Andy Shevchenko wrote:
> After three patches I stopped because it seems more works needs in each of
> the individual drivers. Yes, the series can be applied as is in exchange for
> a bigger additional churn in the future. My preference is to see everything
> settled down in a single step.

There are limits in how much work I'm willing to do on a bunch of
drivers I don't use, can't test, and frankly have no actual interest in.
I'm sure if I spent a few more minutes on each driver, I could find
another dozen things to try to improve.

I can go back to the v1 approach (fix only what I came to do) if you'd
prefer.

Or, I'd prefer to stick with the sentiment Jonathan expressed in
optionally requesting additional refactoring:
https://lore.kernel.org/all/20261018211807.66bfea0d@jic23-hlaptop/
that most of these changes are optional, and that fixing 1 thing is not
a subscription to fixing everything.

Brian
