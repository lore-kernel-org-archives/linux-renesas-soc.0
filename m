Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03945616DD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966898; cv=none; b=ZMA91tWqQAZ4+38Ur8GvBYIboVDjiBfCNue5o2LbL+ZogiESoIgWF2j6QXwt4TE553BgZZ50c7CGliGblVRdTuor5bKE70I59/iVDRv6z7H1T1jS/O5nyyP37Z7XZ6Pk5KpT6PbX+yZH4ZjlcO0+l27i4/vD6qlLRITNjLON32k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966898; c=relaxed/simple;
	bh=CECANy83eJ476WV9+m8Z1DPlG6IR5GvieLQvKQjJhkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBpGiWRE8Mk0Hy2mfImvUALZGVl2qPlK82h10R0Ct4WFO9BgJyCT7f4PO0OLzMmpXSNoDGWQn6a6wAupQriwnlybUOnaznZ4rBjMHnEDZzIwdIsR3aZNlSDPNU0sxAr+d9MYVVpktD0QHF0bJc5IXAMjvWPcCwGIvJMYyUL3vYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e51697aso159148e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966896; x=1789571696;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=haSiNz9f37NiWVNy2OnhpaaLVM7uwzgfEK4yu5ZD+M0=;
        b=geChy/528S2LXswq/BtYk43VLiSEBuTG2dfh71oQZhkFO8vNXIjhNdx+ybug8Crmh1
         OnZkpiku1CSrjV2w5Ouhjc++ZUlTGMQ3rg36innzaTLYnrZZzRHDXu45oClvAO5g3jb2
         M0clz2QNrO2E1iwkDGI9Y7GQBJ+oMM9ES/AFtm1Yqtobqqae9tvELpezP4999a+GckQg
         eHoEmbbaiiexCbFW3ZWffog65OZXA9jPbTiR+RA8Z9keUM2pFx8mnz0Ap4LfHMViTxbT
         TMmgdX5sYd6a/I6Q6lutR7smkHHVT6U9IdsZXqfwGBZYGq6AyzcEXxNslwmd5rWZK6/F
         Vilg==
X-Forwarded-Encrypted: i=1; AKwUvBynjXUeKa3UZutZQhNn7ay9ilBcvFxL9ISUu2n9k1z574N3B8Tz8hjt6Sz61z7td8vG7U+0S8tTNJVSLTeED67tiA==@vger.kernel.org
X-Gm-Message-State: AFuF++n4ixns7DO3rpKINzcMxfrnwdhy19dIy22D/e+tKFeZyc73rUOr
	Q91hapxzwnfpoH5wpruiEku22J33Uy0juXmM5hLxoSBKIoO9zeXTjlEGANGgz5troNp52Q==
X-Gm-Gg: AYBFou3/HOTTpofNryvIEglnbreuDX1WJQgEqSaIxJxTistrCkVrng+5EnFjIh5qL5q
	JC1Kwx+OMYlOhyweu+dSnI7UtnkCx7hHSvtmbbvg15Lo9IeCDoLhSmFpAnYOw++/fbdpJdFvfiS
	Y7i6BvZVX5PcMAm9jiK+IPkQZGJczy2QyT/CFVIpsGOO1uZ8cc2ZyQjwOGxCp5/tPeX7aBkPe5h
	Vc74rUJ60cfg2qJyCOFPZO23etPrBcfSqBKApiqvGCQiIrfqOVcA60teMfX2upC4d/WNv6iJCoT
	FRWGR6zMAmo9Kci/5K1KNhs+5hJrmI65onLl5xNybUbEvvmiqn901LUBAcri252R0rp8Nom5dgk
	CCTMyw4XaUFecDY6yAKp1eCjoSNEAPQoc+xs4E9csn1lbfXJAG08JQQGqsn6n5ZRhYnwxwhl3vH
	WwzIBmbT7lrfBTcaDw0O76zhNyV9rkHZnNvJvB/ZtgDuliGi0qBm8liK4tg+e7Qo/TLsXC//mB6
	TY5RZZBUMNIucEjGqL0lYrnPi/JAjULt8qumg==
X-Received: by 2002:a05:6102:3e95:b0:790:2ae8:32c3 with SMTP id ada2fe7eead31-79075f973bamr909593137.6.1788966895565;
        Wed, 09 Sep 2026 08:14:55 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76aaasm10986177137.3.2026.09.09.08.14.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde3so135894241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcZUYtzQa9ep+7wOK+QsHRhxv275F6LCzOo7sk7FQzKRdGu90DKhmrDNx5TlOnQES5N64uTsyW4q8DrOYZWUwDfQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f9a:b0:786:7a59:a313 with SMTP id
 ada2fe7eead31-7907800afe0mr1252914137.13.1788966889473; Wed, 09 Sep 2026
 08:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:14:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
X-Gm-Features: AcwNN1UB2bvnyx_MDMU6btLmRb2JR3XbtnsQvALz2JEMNNgbbOmmr-5JjuTx89A
Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
