Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4C279DB6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967193; cv=none; b=H5+rxPa6Sv3Zu3g5bl2g7reh907/7TOwmottDeaZPY+Pf2CSwmR2c5KmwmVCBMtks7HMKoz1bcdQgeiaVzY+iS3ww4Zyk/Zus+WvP1hL7pB4sPI4ZlV+RZVrHvCHm1HCyUExuDO0jVjmW5u8YVTCvkdDTgyPuVEwoHMaTuX2aH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967193; c=relaxed/simple;
	bh=mQVTvUE5EMefp3N9PRRXFy1qIjow9eV0PSCua1TgAD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+kOEsC2Y8BdNVQ2++Rvzs6FDeL/g/okI7HTxmfTgHtVxrXXFPfuXiw5uACK5Gcnh+4JqJvoon58SMN5PM2XZJOqTRR6ZeO//zjidoF1jcto4ydgD2V9UTFsdi0UNxg6mWcF4SqC7z5t4x6ISzt1+/RGf9F1n7Kk3+n/gNUXqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-783fffcfb96so4593823137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967190; x=1789571990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ck7KwbjNu626e6RdS1sR80rNpHN5osHYGNVSLeBH+E4=;
        b=mwcjhpK3lXF2H6gqFDW+9L5S4xOAdfMyL5hmky1bAEgDeSqifRovpdEzOvoWVJLsSn
         dghYPEB/exBPeayVGtpcGH+3gicW+whSvjKH63s2iHaAthI8gyEhPnHEaUoHoouMZW6r
         aRHon+BP1t+/TLA72qrAIw8ZwcRpo+RfQHlv96T5gwoLJExE9X8GVo87KinU1o9e07JY
         hh9ITuC9lqxNy6nJElqOhFPzM2I8n+TYprWjYmdUIPTQZiC7mYWlNn9J49ltgBqMdpHR
         AAM5dvqfJR7IKaSUASJwpJmD9BGPWcNG6srYhkFdXWmk88cokkMo64UhD7zLBT4BZE/Q
         VaZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTC9uNuz5Nfkis0t6lLQ7UO0sk/1n76D2yHiskw7/5FCnYfUxNAfR5edc6T7b7mJvaJCpLAyT8xyn4EJ011X9Qrg==@vger.kernel.org
X-Gm-Message-State: AFuF++kcA5mLPJ1StCZDyqn0e4WNJCY3TA2s47Av5qPPKuZviSVMnSLe
	ZB9tb5+Vs/ACjIrSjyzAwMFPEBc3Hy4kDKyhJ789pOpw3n0UEaIxdAUdmXYAZ5jmNjU=
X-Gm-Gg: AYBFou01SEhA6PEaLQ3JQuiv+tPwg/+2WjWowh47dbed1BUogGjq5OVn2i1lwN8fRG/
	i+bada0U0Rbnq9lWE7ASZld5Ixt7wBEd+QdZXqv6GvhcWSFuWRbcKWQRqGixOFhngVvL/cRMolp
	c/yWKcxR9ODJDHhMXRbfIQICHs35LLBE79U/svxBfr7JlEZogGowC+jAdqQchca11M6pNjLxfyk
	HKeJKWJpCIVbxYNwPW3YZyvq176BumA9yaFymB9x5k8ZEME5h7SNiDCzQn0h6XTHZWUcu/JqRD7
	LrE7YzW/giAjPsriEVVGBVAGStIgr+GSudYXwxdg2txEITHMTmykx3g7nksxJ5abDjtdiZAkpba
	JRB7r6UfO4nS1BWUxNQciCLqeqw6q1/TuCR0b1Azf0cDcInLn4hkKpsDj7azROdEtpWoGm9sLDM
	BJMgmLHKFg41neKki2BMqHXcMEGSDJx136lR7xV1cHgTm/6W29GChsnaj2lK5M0TzK14QGGTshC
	v8FxjXEM5xaVqzFcKd422R5DOiM6yytB0bu
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-78a4a6e7023mr18453077137.3.1788967190323;
        Wed, 09 Sep 2026 08:19:50 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808e98a9b3sm12310182241.0.2026.09.09.08.19.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-78fe51a2dbeso515573137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzM1WydVTcsNd/VdYrl34UFcL+Urz6O/anFotkpoTl/5+zL4DWWyRwBw2F+El8xMfvFmJWWPeTb+b4SKI/PGoyQ4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:6b09:b0:77b:28c1:210e with SMTP id
 ada2fe7eead31-78f67ba56cbmr4525156137.1.1788967188938; Wed, 09 Sep 2026
 08:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:19:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
X-Gm-Features: AcwNN1WrudhTWyzE-dMx-744iV6jE5_0S03_iG05gjwf1BiOXXU0ML55Tupw88U
Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: convert drivers over to use subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Nice, thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine, and no change in generated code (besides renaming a few
functions), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As conflicts with renesas-clk are unlikely:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
