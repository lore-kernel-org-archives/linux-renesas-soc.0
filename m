Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9293175A60
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149722; cv=pass; b=HKgoLA/447HzCfYjLM0wufYAKhOybXDS9kTlPnMWg94BDn40orq2MPrDabQ2c4+32CVUkVhnwOdPP0Aw3J93Bpm2gmcmENu/m+ILk6Kg5aIq6UtXkUFdxLPQ3be2cp1kWYCTsYsXdmYIq8GPVoomyLMKPBMum0/ZVi6OKpMem40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149722; c=relaxed/simple;
	bh=SJ656KnIzvEN4uJJLAQ9Eml4yAM8DNf1PNFTDvSkOOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKkFn0YL2pP5lmMK6XXxznFMrZEea3eu4cSGwxXVobriBt2FoxWxMmKKq97xKKBW6gd2hj5orQQod4+2MDPuTELCaB5dPLMLyrqiC6kg0VF03ccK2kdAE7NLA5+UGo64lxnkQV2dYtf8F6N/J6wZPIjJtiqbj/owgTL/QQ7jQBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqyrthqo; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqyrthqo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472326ca506so1684777f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785149719; cv=none;
        d=google.com; s=arc-20260327;
        b=k2hQGrcthWWeG7DeNDzIw4RW3U0i1fDVdC9dMrUrGSCv5kh3/vW8dJJEAZbR5ig6oi
         H3G2/w1kLyS6a/cqHNBtT+soWjbDQaZL9B9Epfnr1gOzjSWFRMyO0x6Tw0RO8aM6/kHZ
         xJXvlzO8zJARzS7+twW5xC8wJeRXPZDqq1SNR6xRCi9+8tR5Pz83Hb7T01ZZyhriqHdw
         Vc/2gBYwP2lpOIpQ4NZnNFrpAV7byOpUdMWsC6d1vtYuASfuuX3QHRVDNZiGI/wp3bPN
         Mfj3kx/vMV3iHLkQohvD3ZgNRYzwn5D4QlNmf3goAt096HQI5IWcF2anrcPnaojfs+zQ
         7Deg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3wT6ps9jhP0qGW8Vt+wvXgG5NyLmZhza1+aNvsfiQM=;
        fh=z4rSxIa3JGuBnwEAuh9WKTfNWxWk6mWbt/2hHuCnn5U=;
        b=GhznGG8EEi4TnkuhpktiYXMW2DsVzjBo6kMYhwn0P4RDhShaLI7GGT6HVH6xCvzesm
         yDxaf8gRBhwfCmYFvU0LICKx5KR3b9EI/C6LMKp7B02rj+pMcQVOVK3ea6hSpekDUSKF
         +a1r1vweRe4KbfCWzlOvvPKPitlRoEZHWcty3JOWeCOQ73JomQ9ojX3HAse6uPjQPiNC
         Ojhpk7Vi9f7BA75lSuipUd6KtS0njwreawhMyXBAs7A0ocxYqLlySqaD4j84Lb92dTSV
         gOJdmKVgMvEi5J3qSUMniUoy8tJQtpskjNq7Gk8R2zkMVr2rz1WWQhII5mP+sS3AYbqa
         FWRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785149719; x=1785754519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3wT6ps9jhP0qGW8Vt+wvXgG5NyLmZhza1+aNvsfiQM=;
        b=iqyrthqo8l4jiwK1ICeqWHyisND23UK5PgnggaqWyepS1YrRhRjyxxvCT+6X2E26X8
         Vd5Am6Qgpk0wcKlbz66qv3iVBAizV/jjdHt3nS14LCpfme+rDJUu6RMGf5NdyYNKy8sF
         XRs9CxwxDI8pswbL8dZ3pz1GwNPvmEpkGPyTHIJ1ihr8YcRuSWMPukx5p9bT8RhtwwNV
         3gBvbneXnWRriA38jZt6TuvZ9yslOmhl5wiUDIbCLdw9a4WacVPp32qF8sHKZo27j9vx
         VKpQUUq152QcgruRVhlWYaYz1ifgjlyZ5Lo/tGDY/OwXf4aR8n4GbcJMOdb389aUcUu/
         x4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149719; x=1785754519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3wT6ps9jhP0qGW8Vt+wvXgG5NyLmZhza1+aNvsfiQM=;
        b=WDq+fHBYiJQW/OkvJG1mtnRzLuXEjeruqfchX7kLB48/iQS5GpIFqGr6BqDQHmvHVE
         U82ODLnRlbIaCmwfA9LprEh6uuHDiTY4AXFYj48A5IHqHPqZWyJW54sURJFy9La0wqL6
         Ff2PLEAnh56OCewykMM6TaKdbcQ5c2n7blydFvsC3F43ohp8cBkdyRPmpTc4Wp1Tyvip
         LLThwEp29z5dAG5g0NG0LXedYpKH+UQap8PDmPwVlCOUfz8JUU5hVA4hpCvcth/WHziv
         KuTaslV7DPd2DrTMz7C4M3lC8TpMkUgrKfeWqpWWuW4BbIEgJ4XRdkyWtXX+yIoWJWBO
         aKZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr41aq6Z+zukoz/JXqkCvEZPkHxw0KRk6EyVm3B5HZUfjz7oehv9JAb2EmDwBxWbOO22YBlKGC2pTlID+O69+KXUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMEDav7lm5qGCbieUJ2UGBr5h+99eClhS5JdaQfRRiunnZZUOt
	7tqqPibMZ3x2Y6WNmDgFHqLmCSax9Oghsuw5Ks5edkzct+dwPVOrHVnltt2xekYMAaJN+EH/idk
	ClWoJwPu0Ljaw2RvRoKEhkGBEsWA2Rzk=
X-Gm-Gg: AR+sD12R9i+05scnX56vsFqZflmXV3kulMXRk/MfycuOEm1OeRXSRYAPD9xSbzAo2a7
	DvGgIrvudJgAEuLwKrA8bbB9RFr2RKmbe9wHRoWfQ3u0nVtIZ1d7ZzV83CWX2NrH3Etn304H2i3
	Ir1CJTlf+VqoURlm437rp0f/SthcJWAQCt4cL7sRFSJ9NKdUJlnqdNA4cLp9UUiq12BbvCzAx1S
	ylL9ksOecCx1WiI07auWovIbqRPrnWt+ev0bdMIpqKCXBWopqe90RHp7JaNlwXEfDahOR7VbHA+
	UX0JOEl6BcNr2MoCQ9TcrnEZqfAPQvv7uDDQ/IKyGglynjANcA9vQrspRX20OTHdl1bEvCakVCK
	P/ALY
X-Received: by 2002:a05:6000:2c09:b0:47f:923c:9d92 with SMTP id
 ffacd0b85a97d-47fae7aabdamr114692f8f.51.1785149719033; Mon, 27 Jul 2026
 03:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260715133922.2129340-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <0eb41a71-a013-4686-bd9a-4f4df5acaa3a@roeck-us.net>
In-Reply-To: <0eb41a71-a013-4686-bd9a-4f4df5acaa3a@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Jul 2026 11:54:52 +0100
X-Gm-Features: AUfX_mw_UjDRNyZht9hoN_J_DKFxeJtt1sRoyca3DWTwQqRK4wCwyzKemt9mUKY
Message-ID: <CA+V-a8v_FXNp-jvkM3X0sEt3-Gt7zm9kq3cJ7hn48Dnod+O9BQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] watchdog: rzv2h: Convert WDTDCR handling to regmap
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-watchdog@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for the review.

On Mon, Jul 20, 2026 at 3:56=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Wed, Jul 15, 2026 at 02:39:21PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Convert the WDTDCR register access from raw readl/writel variants over =
to
> > the regmap framework using devm_regmap_init_mmio().
> >
> > This conversion serves as a preparatory refactoring step. It allows the
> > driver to subsequently support syscon-based system controllers natively
> > by passing along alternative regmap handles without forcing messy
> > architectural branching at runtime.
> >
>
> This patch does a bit more than just converting the driver to use regmap.
> It also modifies both reset control handling and runtime pm handling in
> the start, stop, and restart function error handlers. Those changes need
> to be implemented in separate patches and explained. When doing that,
Previously the rzt2h_wdt_wdtdcr_count_stop/rzt2h_wdt_wdtdcr_count_start
didnt return value, with regmap support they do return value. So now
we are just reverting things back in error paths by putting the
resets/pm to their original state.  Please let me know if you still
prefer to split it up.

> please address Sashiko's feedback or explain why the issues it reported
> are of no concern.
>
Ok.

Cheers,
Prabhakar
