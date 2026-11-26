Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693559;
	b=h9KCfD0aks9JodVsXf99eaAX49kLQZLDnRjW8JBSmgg9suQSjUF71JKyTQHKUqBWtf1P
	 7Q17j8zK3u6lgkPnqxCtVWKzwCgSRptk9gEKWHrL6qRVmHezTtJZVEwO+MehHMg9V1gK7
	 Iw8iUTEHo1smAUILUq+1aLoZo92tGYQbLgi1Yh0ptF96T2lS6I6lUCceL2ysAHTNfuA4j
	 +Uebyv1a3rb7t0Lvk8RZisi3sPCueTr4QtI9J6yDMZ7ojuQBfqcpWG+X9Bay4ujgp4n+V
	 yfvJyfSfIw8/l3s2R3hEcMKcHGVeWvd1F4M8aKSbVFifoigrBYJnryg76MPl6k+u5TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KhpuoXVxsmipcY+EIJDYgZSdqvKp313n7f7r77OAm5A=;
	b=El4hDbzwf9PP+IBuMcKu7CiuA4xalKFVwhbId698sqI1VzhDHPQes+VVGmxIWokFuzU2
	 pxmTuJ5w3s2MizvGFNDFlh0+Jm29ujs2MwG5w9X/t8hDd1a0huXk1bomnd86jm/lHkQv5
	 MGGN1SGHUtQryXxBlb2EyhccH1A6n6araCZuGS2xjf1d5AEcsgC/2V8PIl5URzMOtrh7J
	 NlHDkZRYbXo5+1RP5KnkiHVS5xR5dUf6uoVWVbSgbTnn3EKDcjcXkAawq1uY6hfit2o6k
	 GwfgM6B90u7FQZPb5V9fLHZD7nCQTVqtHbP3kwDLYPEQT5AW/NqURQMXZttVc5lxlAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjnbXg6o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81658606A681
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 11:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81658606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjnbXg6o
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1153929466b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 03:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693558; cv=none;
        d=google.com; s=arc-20260327;
        b=GFE+LF8cieW4WofyKo3DOFWWjDCLyUvFaFuZEmFggCUWa+yhZQJEzAZH5F57RlThBo
         LOjYCnONf+bGgJxDXLrZ/zyTCzoNFNwz3ec0LNQuVCzfQlnc/f7gwthfw5VezGXU7kYC
         gjABr2z2q/iHy2j/KDvuIrL6odCI3uaqEeEdExwY7wfFHTGJ81mXnpT4SXHVFBzLl9Pu
         tmm8UdpNihWuMSjbpPx4ko6ndez1JzA1+Y3H+zpaw/RjEl5YDSFWb4TtopQjsXV+4axg
         GqOFzrOQPARxInEzKYCAJvCUchtxL5XY++lhGhf5SAYJtZmwGEsgqMFpTkLRNXQClSVA
         xa7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KhpuoXVxsmipcY+EIJDYgZSdqvKp313n7f7r77OAm5A=;
        fh=ryDV0JwvsfdDWvsSLYQCFi1hnDGpgXwSUGIQ7CPY594=;
        b=lowRQxfEzn8Q8sVaHILx6MDXJnyEwJ8TEtmbuD+CKBcdylzjOjlYNJIiudyDZQvuVk
         Kofx7u9NfHqCPvW2LDNYEzubcLGs0B4fbbLnBrc7Na8qHmsjuZobGGL0GwFKvJ4jyV8M
         an+0iR9TRXFDyApNPNOcCoywNl5CNBsHk8F3mp9bZOWMC1hCiN0pkBRD9hKYC3Q/ZbKN
         VL12n1G6Sh4rtTekrTs6BSwyCLkjsI5HFKPXXboTf8nAyJ1Lmn6n33HuMzdH28SiYr6E
         zBouj52nz204SyPifLjyMQldvVGHByaMqW2/gB9VAr0EZzxui9a6yd51j80QVIW/7ykC
         IGng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693558; x=1796298358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KhpuoXVxsmipcY+EIJDYgZSdqvKp313n7f7r77OAm5A=;
        b=MjnbXg6oubXtXF4GY3n6Ri5wN3VjErZ440rJoOeW/FZXxlLziYjCa4zwOuzVOB/nM7
         kxDEQqXK5mGAAmvSrTNNMya2J9/qUJliW7Kq2H0el3Z30EEyWCXdcgpRU8TGeVQ8+68r
         RO1es397Vh73f82VTxxEh9PLH6ii2fkNzbtnp6na+zBypER3q8Mc/gruiXSmExGh+Mfy
         8ym4h9wJf0JSPuljojTsIYmmtnC7K6SLxBkJRLo5+r8KIpCXVuym419RANN7BmeNgJk4
         qUw0UepBK61we9Ih9TJMsCa1vvZ8PiPQ0wt/Q8x4NL2px1sTpsqJYpvCzsbn4BZlWK16
         B21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693558; x=1796298358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhpuoXVxsmipcY+EIJDYgZSdqvKp313n7f7r77OAm5A=;
        b=bUx8XDX3vdNjjBMBqfHx53HeA6+zNwIoy4lNJhzDDqOB3/yn7TJuulc73jIAdoJXEH
         whiyqexvSnBeEYcaFMdMvF0MpqzTYaQCcnBnuKAEbVIAIQLzpw1mjRMDofTuHWLx8kNg
         ZxSytfWoZOzlY/u+82xDmzkRJGETOpCrE2VHiyzZst3QWktrXb4KOMsCtDMiNhLlgIlZ
         3K+X+Vm1XI1H1x0NmUtS/H3qZe0cBcHtw/tzJJ3u7H8bxah40C57ppaTRkWWUi4qjg+n
         j7BFx59QP5KP07B9MWtvK0hJmbj2jukIRk2ck0B4wAwgXBCbsCE+7BuBpGBrc6Gm9Kia
         wSoA==
X-Forwarded-Encrypted: i=1; AL+hErGkaVoRLB06UD5OL0E7NL+jkxgawUXkCKRrzZwYFKaY4z3GPnBahwf8iXAxkd9eeiMitJRpJtCGDvHQLxcl9lbNKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OYaeeGsLfRIUXQET05B7F8OFzsL2eEsFLjPzl9o0qOcSRg09z
	qLy9jjE9E13CKNv2XA6nZ7LPfVHVzPkddyVdyBNe7sdY5d8hRHxMt2S3LKSnkRLJX76Jd76SWUA
	zm53PoyoOenGggRgkos/h4+GDFwNyRhI=
X-Gm-Gg: AZFdTZdf0OS38Tkw8uDZrI4Hz9cQ+x85wXuXI3fIX4uCsx+ar/pepibnRUVwgOqkfP3
	1LnMPogfVzJiqSKsSYXqDtPwEfZrZkPBhsOJBnj8HubEcmVrHFyTkQ11J3I5m6x4Uy1NBjVZKhL
	uDS2I7BhtGT17P/z25Je4dlS0xcSwt+NJCKD8MXYAcQJKto4+KbosokVW75AvbfDK4fKWXN6cC0
	9gVvO0U8Du6x2daiVYdhuaCl/5CR8RjZCHNptEJTaRb+7Q9uEzv6qpIP/6tXCkjM2dixY2MT2M7
	TlNKx39ZSVsgx7MsX9GOgWB+myfZsrLgsjn2kQEe5O6FPKvWRx3I28FXb0lH6sr5Nn5cdXhGG1v
	Y+2hOj8ZXiLhgf5vc30c98MBPTCZKMAZt/0K84YWY3XN0+Aqds0G4aFinH3KAz6EzIeVukfDKGs
	2z+bqMWrIKIKnxoToCmAb15Ps3nL0PdBPDixmI5+z/8UesqBvW7cIYEVrTxQ==
X-Received: by 2002:a17:907:940a:b0:c50:94be:22ab with SMTP id
 a640c23a62f3a-c513a805245mr1958182366b.18.1795693557771; Thu, 26 Nov 2026
 03:45:57 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126081155.501493-1-wenst@chromium.org> <20261126081155.501493-2-wenst@chromium.org>
In-Reply-To: <20261126081155.501493-2-wenst@chromium.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Nov 2026 11:45:31 +0000
X-Gm-Features: Aa3M54ply6HBL37GF18a3MYmohyvcmh2WIoJZK4wXqF_bZ1XD2F1MsOFc3J2ofg
Message-ID: <CA+V-a8tqzDTbMu5375vub=DBHmpJWW2TvUGKfsuPf_gjpSuC=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] power: sequencing: Allow desc=NULL in
 enable/disable stub functions
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 8:12=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The non-stub versions of pwrseq_{enable,disable}() are no-ops when
> the descriptor is NULL; however the stub versions always return -ENOSYS.
>
> This would require more code to deal with on the consumer side if the
> power sequencer is only needed for a subset of the supported devices.
> One such example is the rzt2h_adc driver. Only one of its two supported
> hardware blocks requires a power sequencer. The driver could be built
> without power sequencing support and the other supported hardware block
> would still work (provided the Kconfig dependencies are changed).
>
> Align the pwrseq_{enable,disable}() stub functions so that they also
> return success on NULL descriptors, acting as no-ops like their non-stub
> counterparts.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Added blank lines before return statements (Bartosz)
> - Collected Biju's Reviewed-by tag
> ---
>  include/linux/pwrseq/consumer.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consu=
mer.h
> index b69117ad3fa7..d3f5f37603d6 100644
> --- a/include/linux/pwrseq/consumer.h
> +++ b/include/linux/pwrseq/consumer.h
> @@ -47,11 +47,17 @@ devm_pwrseq_get(struct device *dev, const char *targe=
t)
>
>  static inline int pwrseq_enable(struct pwrseq_desc *desc)
>  {
> +       if (!desc)
> +               return 0;
> +
>         return -ENOSYS;
>  }
>
>  static inline int pwrseq_disable(struct pwrseq_desc *desc)
>  {
> +       if (!desc)
> +               return 0;
> +
>         return -ENOSYS;
>  }
>
> --
> 2.56.1.839.g22a8290db9-goog
>
>
