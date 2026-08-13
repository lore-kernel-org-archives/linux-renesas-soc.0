Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02AE34A791
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623397; cv=none; b=njiNVmdQRPdK4aTM7DlLz/DapSKOtx83/xiOZ2bhRiWlrs5GmdsdT6DgR7m/E9e5LXw/wLnHTgI9KwhdtdLEX32u5RkAeqD5NkhBO/hbmFfQyuga3V0ZRqx8v2DTYEQ+fHr3CfZDObRwAS81yJ2W89tuckoPWyB0GPwibuaMp/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623397; c=relaxed/simple;
	bh=vZMp/jhSedRjYjERTnbU5fu00RU6pQDbC5U3lAgvHAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzWb/271CCAokZrbcAcj3hiEjkFTbVxioUOfCr5HLGZ7uRixkXCnXOp0NjIgW0nbkjf3Df5PFa1pdhspPuGm1NPoS73lK8QZjumQtTaX7nR2gcigWRUAmUZYsY7DQmQd0b96SISM9eMzEEHppacJxUCanrcJYC6bw6EOnuL3YRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-74ad03fa605so350602137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 05:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786623394; x=1787228194;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eUEz9MmS/ZMTpS71m//GPTdjmhNSfvkvxegoNqBBD7k=;
        b=cVtWmKzPVETVOfP8CMHALaDJwM1r4XNDlE3aqJWhqQ1Sc0Z17a0nYtdC0NTmkLYKB3
         Cpz9UbJdd9xjSOaiwXCs4+DcxApy/Xt32rTZnOTU60xs6IuIzEKazLWRTGBN3+Kw/HTr
         QlDEVQVlkhdOD9cUTZyjelRSDkhPTygcPnamKXT9EfkpzbN5Nlgyx0l60eiWeyRPaySy
         HvyttseKraQXI86m7WJ6yL89m3KwavPdSrssQrFQ6z1ZDmHDQS3SsgvuBB+IDVh1P39J
         gaNk1T5jXTtJdkc5iWQi2HehYpuIRVaH8ENfRrRW8Hl8YzLOc26Oqb7Mb9OtKy3pgYQ+
         t2cQ==
X-Forwarded-Encrypted: i=1; AHgh+Rph9rhXfmu7c5c4SgevO4dSQ1K4jG+wf2Lc3PLH1wsnn4nvkT5PrWPuMKag1xvYT/EvCvGw3S6xnGDPBrjAzdtvxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9t+Pty2DSX3aH875Rn8We5CI2IhrcedgquJchBXcPI8TL3NfZ
	oQnDZRyzpQQVdYJ7J3Tfi0w6FbEOZ1U9k5dZetSDkc44mV+MRUc71TqZEGg6Uz20
X-Gm-Gg: AR+sD112Hn4P9OvR5i0eMn811PP9UED9gPOohmjoGxbOKju9ek/XMnPLn5zaQmSP614
	B8Q7N+OK8UHGRa0QcC+0GSY7XFGJC0VxopH/8icA6C94v3OFiyUgU/gS381oE+IERQwex8QbZZe
	KYO/mXdvPA0uOnbsq8kMy8MFTtYZXjoXjpguJVya26WvLeu05dCQtXKrnjgUQRr3g+9mesA3lgS
	Oolp5Tcj7QNjN6z+2JOXh8fZJPxNvIiXymzs7RxKwyVlDyE+qgaQ2KXmkCAKg60p22ewHy+oLYc
	AsiUPjyq5S3wuQgZacICtOcjylmrkWY/ONHR4CNZFnyWO+W4TSWMd/Y/G3jNbNSGGrvv7igaCuZ
	AjcBH0lY7nHZ8MF37UETj+GSFYuxey3tjLmvm9R6TkwMwopRonXH7DWn61/bes6R1S3E8lQf5zd
	JYH+388vBzrDO/2XIKAWcpFDJi4IHi5hLdf3q/Ijebag3xW5FXO0gGxJkrOn4bugadvnLshutgc
	KLR9arRdy2lY7usLa0CjfqXVA==
X-Received: by 2002:a05:6102:4190:b0:738:133f:8d5e with SMTP id ada2fe7eead31-76db7e908c3mr1377229137.12.1786623394422;
        Thu, 13 Aug 2026 05:16:34 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76dd32b9d2dsm922520137.12.2026.08.13.05.16.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 05:16:33 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-73791ee3612so339883137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 05:16:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpCBZbkbGsGbJw2kk02niTXAx9vXkFmFgzjE+eMIA7xB84lZGpFKQGvpKVs/nIGzPLtJ5Y0j4q3n3sxZKuQ+rSOvg==@vger.kernel.org
X-Received: by 2002:a05:6102:4495:b0:74d:cef6:af78 with SMTP id
 ada2fe7eead31-76db6082df7mr1479352137.7.1786623392340; Thu, 13 Aug 2026
 05:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813111121.1672-1-manushprajwal555@gmail.com>
In-Reply-To: <20260813111121.1672-1-manushprajwal555@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 14:16:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0H-uj4VYdrsFT2ThRdEhX6Tu9V-A+gdonxGXU0OvENQ@mail.gmail.com>
X-Gm-Features: AUfX_mw2ew-azI0O3O_fm2ZjSGzSevwqJHtDqQb4wOTW-IKRVJm0PT7TTvi78Ig
Message-ID: <CAMuHMdX0H-uj4VYdrsFT2ThRdEhX6Tu9V-A+gdonxGXU0OvENQ@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: renesas: rswitch: fix device_node refcount
 leak in rswitch_get_port_node()
To: Manush Prajwal <manushprajwal555@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manush,

Thanks for your patch!

On Thu, 13 Aug 2026 at 13:11, Manush Prajwal <manushprajwal555@gmail.com> wrote:
> On an of_property_read_u32() failure, rswitch_get_port_node() sets
> port to NULL and jumps to the out label before releasing the

s/before/without/?

> reference the for_each_available_child_of_node() iterator was holding
> on it. Once port is overwritten with NULL, that reference can never be
> released since out: only puts "ports", the parent node. Call
> of_node_put(port) before clearing it.
>
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>

For the actual code change:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
