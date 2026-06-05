Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DFA477981
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644401; cv=pass; b=c/fFar4Go1rmiUwmGcSX6eQTGFMOxnbw/wsnURG2gpV/AtWLn1NHLxdhUs76l/wBEfOTlW2Eb/TfVwnA3pUqN5sNOXZ3QY3nRh7kIQ8hZ8JFmSGOk6Z5EL3WpCscGDt8p0pjsaZ/wVROwuSuX8PyM8d0WmwLiwxK4jBq0gr6Lms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644401; c=relaxed/simple;
	bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfCLkjQL6wGdOI0F4paLlYq4Bsh6fpiCBgLvKI4kEBvMvHkpxcGB0I4xmMPZYJog+oNryrdJGkgsuTSLN4EHRVWDDgT0lknMVo1d/Ft9RxShViTRbU1BRa5aRLrN3zo1FYyIXg3s36cGITH3unGXw9jM3iZ9rpqFA63o9FEluLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjYn9/pE; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjYn9/pE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso1539412a91.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 00:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780644400; cv=none;
        d=google.com; s=arc-20240605;
        b=BCW0WASP8/fNiKNKkRsoPfm79GI2I1e0JmCEVE8fyTeTT04JcCNFiuBsRjzn3izFla
         VezmZDsCoEUwxjuLAiJXbPmIYLr3d6FmM54ZYNFfp1Q/zG0Dqx392h8bCu2yj2QZFKIh
         0QjXZVUEacH4du3rvIHy4Fb2x/d1hDhlSPpxrvUyyWQvfpJJYzFTot1LSz1OoJTaLIfB
         Ub7mhnhRk6G1PCTU5vlINdDxddtuJkEXI6HJh1sGlJ7ErcF33alHtZKgkJkWBuIyjM3z
         fWdKKIV0ZZ4B4xghNqwcvqzijr6Cmx/3XOXOK70GQRLni+zfmROOGRD4MSmC9Yi92VyG
         EHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        fh=/ZmiJ6AkAUDGFH1Is59w5dwXzQgDjx/1/Ezna+uOCRI=;
        b=dpzZqV7fZETH3ahKTh0g4AssKxz9V/Klgk6Od0D2KWE8rf4gG0dN5mJzgGBcQV30PN
         yHYd5SQDrH4sqUe/rZQ3ID0EVzcl48rcAZapn6MtEyTqRi9QdOEc+jvKAjsg8Ifw1kBg
         KbaYItZAikg1+piR3daOCLPTUqIN7jSKUMWWuIUgE4ZrjGfcXj7qcEI9wFlXdU6w1fD6
         qjghk46iUxG4ynZ+BRM/3mTaTea64GfBzriY7kBXKJiLA6yvt2udwOg/6m0iaNvcVTJP
         0QwIse9Ii+92bF67EYuNXDdrwGKdPtwAk1dcqoYEqwyXvqe021wseGUdN9hZp61COIjV
         v3dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780644400; x=1781249200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        b=rjYn9/pEh05QzES7RoGmkHiPvNIIbN/2odtkES3+Mt9zgAGbsVTs95R3CZzfIin2VV
         LnAsXEiZEVoZySp61BwJbJSvzgKcw/M2jOVbL/2vKiEgpeFGvCKTZ2PKpD4r5XTT9eyr
         3Ed9jgWuXEl0G0QiX5jGY0WOteuIQkIYWJMSAU5kcFkv/YdfF9mgLe00KLpi8zbOycMN
         1tfrZvt8GANLE7jb8TQEm1ZAehmtiK6Ha21mtlYxIkKMM7mFwhIRXQVyt8dDcWPwSM+E
         Xt91Qy/KFWlGR1w4LkuYh/fGvJWZn2SgpCjrvHt9QW0oJXJtz62Xu2l4+7yBT5OmElmk
         wLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644400; x=1781249200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        b=FPwc6+oxtB/aKzlVeqpZ6fC/Q0WxFKWAXiHNzbemnBogQiy90HpHE7/w12bYbmaXfk
         3g9ZeyqbMKcOc5i5aEIcJSnws2P1RFx6P8kwzIgaZnmF8b4bhuQEFSjw9BPLUn0BkeRD
         T1ZgaWV6ePVHjlayAnyu5QHnehZkMvRpHwCRQEw2ge64eCTOabpDgV28aU10zztUoHCs
         deODzxI6MPCEUE2D2fBuRpUZ8FBcYBVGH7Lv52M6OKucvnjz9u3n36kn3z/gBLFRvGc6
         37iaGw3DaliWEfmmgap7g2fIJiSQo2KPYfVwXO1jojv5ejnRmw+SB45wx5/T90yBhXkR
         J7cw==
X-Forwarded-Encrypted: i=1; AFNElJ/MQ2NfAi368oMldxbvXQyCLclo0TkxfrdV+IR6QG5eY3DcuiDnL3ymI78JmeJ8YpCK1faP69vM8yb/2knQhXOA/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFzGc9+BDyQiN0D6dAi6zqx1SEAMKfoZzvpfFriQJqZSk8qgU
	zsgfirSouV7nK1WMPcpzXmVvWlSXr072KPbIIMcEchAd7HJNYne+J2XWKVfsXx1VUDtW0z5oVI2
	Jv1W5cSICaAW8lcO3/VM4EJHbTXXBOLc=
X-Gm-Gg: Acq92OFWiFJj48s0cdtIHFR3AxJuKsATKNZsAuE4IC2ce17WjlnnP61vltMLMXu9wfj
	GInXXeg4r9YviD+m5eYIdaDQrLAIwKx9CO9BaFWOpKCyPZ2n0YViADUUOm614JtpnsE+xuOTgL5
	53Rqnsui0dvWCnJfWQ8ceaJtd20Wy5sQpsTCwy5dUUxEQwY5WjKcXK2Zwd0Jls9BSPtB2IrSywm
	9H3mF2EZWFcZn/2QL6DhlHa+TVUA/U5WrBcWgDtnG4MB4PDukkeLDwhrCy6UAmd7bWJnQaHigI+
	Dxn6VQArMm4XruUnC1iUobja3u7t/gp6vGK7V7Ep7PVDxOcE
X-Received: by 2002:a17:90b:2d10:b0:369:d7c6:450a with SMTP id
 98e67ed59e1d1-370ec1eae81mr2749184a91.0.1780644399899; Fri, 05 Jun 2026
 00:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-5-phucduc.bui@gmail.com> <87cxz2n257.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cxz2n257.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 5 Jun 2026 14:26:28 +0700
X-Gm-Features: AVHnY4KOKDgSpb0rAAvqs2woy5Hzsul7irxFMBOzIzPmWvsBo4cJyTwoWJkizeI
Message-ID: <CAABR9nH3pZZhvRv5kQOB-kBPgpZ1EGvvrMS8YYoSLtyA=3Z55A@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] ASoC: renesas: fsi: Fix register access from
 in-flight IRQ after shutdown
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san

>
> fsi_stream_is_working() can handle that ?
>

Thanks for the suggestion - I'll use fsi_stream_is_working() instead.

One thing: it's currently defined after fsi_count_fifo_err(), so calling it
from there won't compile. I plan to move fsi_stream_is_working() up, above
fsi_count_fifo_err(), into the "basic function" block - next to the other
fsi_is_*() predicates, which is also a natural home for it.

Does that sound OK to you?

Best Regards,
Phuc
