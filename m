Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34D53368B6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060559; cv=pass; b=QSvNOEdGC31Xd28LgQD5He9pm9xY0jUtdKsmjfYjK6kAxJkGS7/gHVbBUpczbO6rC3empTPSqQYJ7h3VjvJBIvxqk4lKNJq1ZWyftXxNiwa5wBfcoKOEaIpfXOevIc9uJ7Tw1frxIcuzs0e+5UiVa/eixzJ90cgK0o6yjCBKnlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060559; c=relaxed/simple;
	bh=BELWqzWUWTPdsciv6CHCfEhJicXEFTQV3kH47jXL4jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfwSHy2Q1ngHfJ+Pzg3rnsuVUx2SvV5UWWJ/+onxpHgdu5UDS0cm7VKeOwNEy4Eids1gPQZIkmaHo1rlt+bpLx34KyfNhpR1M8AhPuptIUSOY1mc7nXIWAZP5/DuMHYywZvH4Am5UQaBrqYvU+aZ4l67RU6lIw8omXNi7dPSN7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sM76bZHc; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sM76bZHc"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so3920726a91.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 20:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781060558; cv=none;
        d=google.com; s=arc-20240605;
        b=VsGUkhyaKkafRgp/sVr82alEdkDxln+4Gi7LJy9zoItUozi2LA5RoJRBizVLdkdRqy
         KRvS1XBz47yRNukmhuzafw7O+lHdT5jQ57v539I5/VWJjmW1aMze/t+4Ig8BE/gQw/A3
         IryerOoWPSi0td8Y7VGvkKg0E1jfhypcTLfA4azyNerfsP/avI8AljkuoL7Szg6+VrYZ
         WTFv8QKqIFsbnxRqNPgoN+ILpPaShX07eAILJSDgxJ3zyX1AmPZL/5V6p5m0Ux3GshL9
         IP16TXELTlfgm+fcPq3nId8IyFqXPspZmT/qfg7zy+Vce8vyRcjUtlmkFaXKSlAXEdru
         5PFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        fh=+jJHYsf8CfzQMF/6ARIS8zYAQccF/l2YkZvam2m22SE=;
        b=HNPR7/aMpleq2iQ28SlH0WBoJ2IiztpgTUvBcrFQov1MC0XKHTKOki11WK5hYKzet0
         sJkNcjzjTITiLQwIbW5mb6c3bjplCOmtLEkRIhQC1YefbD1AcSvD6im8njS0HCvDlqYs
         gZg66cWUFlUrlBhaofQYYNE/+jmI+BIW9ig7HXfHWPlrs+NLFfuZf2kt0Z21g+uamMPI
         YMyiTb7eE64yMlT48F7JeTvk4jk2u/LDEnZM34KoLxp376q2gFpp0bSiHM7saZ5UMK68
         uoW2n16SlW/gQYMZqvWlpDMMSDNtViIHUkq50B/seQCZwrJzEs+82hY1/icd5f/uN7nV
         lVmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060558; x=1781665358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        b=sM76bZHc/3eJL+X8ILCMQv3sA2XtzTJ3PY+2QxYGtJjVWtmMXvKYJ7UIT/0Hl4D1aq
         ft3eZyL1tMrDW3L1eNYHvm1Kizt8Dxg5zaBc4VgZ37LXFhEkCSNBvx3leO+1S2ezWqX7
         7wZ8aBlDdZDjbck9+ZcG+Z2ihArrt7OOAlVqoZ+0gsvbt2Y4YqZ4svz04Xwxb7wE/RKf
         rxbsxO/IaRaGbhTDDQwNH7qBmxd4u/U8gi2pA5r+ZTwu7QgbQBLuoIFKqjFd+Byl5a5A
         /qvAyHvoOHyvEqJq0G9O2Wj1lYFb60SW0OS3Dsp0bMYlJl1Uo0/e8o6NxeEjKE8k3Dqx
         lHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060558; x=1781665358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        b=qtPUxvswSA62tHJsWqxcLaKHGnrdb28I2hWtIqz8x7kPlJ8PO4O5ph3tcUqdVyzplW
         n7RqdUIun9IahzACr4w/EXHfH9dyo2m53oVMmhVCg6uozuKGHqx0Sf+VuKWwym4vaeXa
         dXk9dc9ZeGjDc8XIDydNZH7FBAdwwbfd/iJvruYU/cRqgqhHYyqWk3PzPAu4n3+tUoe5
         B1CaUMRsd3aYe8GpKUKZ1KKyb360/ok9C8W3JCzWN6hpFkxnCZXeK/2xo2WWGfaOEPkV
         SgYc8wjO8XpKwj1dKVy1ujRaB0fA2LjnLu1+Bc+xXAaXCYekiuTwd4nncUrB5qomWMzg
         hCOA==
X-Forwarded-Encrypted: i=1; AFNElJ/2GcMsO4Lhn+xvekL99/TLGeXnL3ZhfGSYUYQQIBCeeC+F8yTQCXTWZpxoP+/FcBevyNybo6rmy/8F9QhKMeyRog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyehOrJhniCl31p7fd7YoZQClRYq52a2PHDPP5FPw9z4c2VCNC
	2xBDNxOm6t6Qu4m88UzEW7pit4FLKZfil6ubqOMLnpx7TZzUL1BQTcOd8IaojTzFmgpm9+hCpZ2
	CfpdT4GaYeZvptPF+9OIUdGcrnonqK1o=
X-Gm-Gg: Acq92OHRjRTp2pxcO/SDLbZ4HClHudqJRTsbl2/hdZ24gb1y3HbFwxT/Tkao3NON7d/
	yVuKYPvXAcMB2mxGqMFQamkBjOhJrU5kIN19nWklP3IM/EUaM2cykXARi/4aJkz2Ndk2AhG4vTT
	SDUWtfxY9UEVnbEeDFv6n2LjXc2L8edRzfnyLzbLQNdwm2nfbYP+fsMXp9Lfe2Sc2Oivs5Bvrj+
	qrSxG+6HZgF9WBvF/fr/2HPPk3lEU2uOl0qu3mS0kaQA2udnOD4XgRn9ZQvlpr6ZT3BG9KgXZYX
	w+TirP9BU7ZpwILWdVwrXv1M1DyNclfbzydbIW387z77t10zgn7Eb5YfUYM=
X-Received: by 2002:a17:90b:5783:b0:36a:4074:9aa6 with SMTP id
 98e67ed59e1d1-370ee82fcb9mr23111578a91.6.1781060557754; Tue, 09 Jun 2026
 20:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-12-phucduc.bui@gmail.com>
 <aiigtwDM-qEBxjH5@sirena.co.uk>
In-Reply-To: <aiigtwDM-qEBxjH5@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 10:02:26 +0700
X-Gm-Features: AVVi8CfBRh81q-V9vKQU8QeMWprqYN4zKvZvg-BCK79uayFJBD6bEhlpmrZ0dxE
Message-ID: <CAABR9nGVNFs6GPZaKA6JA=+G6J3+WdGcn2T+sac1YL5N0VS=wQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your reviews.

> >  static int fsi_hw_shutdown(struct fsi_priv *fsi,
> >                           struct device *dev)
> >  {
> > +     int ret;
> >       /* stop master clock */
> > -     if (fsi_is_clk_master(fsi))
> > -             return fsi_clk_disable(dev, fsi);
> > +     if (fsi_is_clk_master(fsi)) {
> > +             ret = fsi_clk_disable(dev, fsi);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +     /* stop spu bus bridge clock */
> > +     clk_disable(fsi->master->clk_spu);
>
> ...but the matching disable is skipped if !fsi_is_clk_master().

I understand your point now.
The reason I originally implemented it that way was that I was
concerned about a potential system hang
if hw_shutdown() failed while the SPU clock had already been disabled.
At the moment, it is still unclear
to me whether any further register accesses could occur after
hw_shutdown() returns an error.

However, I agree that maintaining a balanced enable/disable sequence
is more important here.
Therefore, I will modify the code as follows:

+ int ret = 0;

+ if (fsi_is_clk_master(fsi))
+       ret = fsi_clk_disable(dev, fsi);

+ /* stop spu bus bridge clock */
+ clk_disable(fsi->master->clk_spu);

+ return ret;

If we later find that a system hang still occurs in the master case,
I will investigate and address that issue separately.

Best regards,
Phuc
