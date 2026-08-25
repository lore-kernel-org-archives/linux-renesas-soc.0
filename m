Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF8476CFD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664416; cv=none; b=VqRY6WkgKtFygjQlNxdA9eBEjkWC2eFUdeabBhjpsSZ4ihgNKZpOXqAtq3GhBbluWh2WKvjohTjtWWPk3ElmHgxnW0gUTMA4BBjniZ4WUwyAudGu/rGSIswfh4rsNN3oC6bi2o9kRcQ6XPUnZYGo+HltUdBpBORB4Une0oAb9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664416; c=relaxed/simple;
	bh=9/3kMz7oD10d8hH/1927Zsh3839HLOBI3rMLP1VBgYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8w3aZ6G5Uoyct3Jx6vcr08P81L7YTQTC5M5A05Lz3NZJj5Oy2ol2P+h9CoSJSu/+Lxxe/B3bHttiFknYQrI4GDo7bPMdQYz5aOcE+gzzUuhQOzs9cLgXCl5Xff4l1i1gjfW2jD1qo2zplUkEp56M/vXFkDhdOQB9JLW2gYQUGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c167aa9500dso725590566b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664404; x=1788269204;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkaEb+Y8kcpcVv/97rIlADSPio9zFKmAgHXudGugDJw=;
        b=jaKKeIWjnJUg/TAbhcfQAB+mydoVFLRP4XHlNs71LO8I71LIyUv85tnSOr9G+Mfccp
         4yYiKV3HQX+vi6yQKBJdVAfW7mYdgzFOi51HKtstFUdioyD+F3gd9U3dWXkcZrMXdy2C
         2jbRUU09kfx/ryusyxYstYRlOZ0Ai2VGewAWR31TuyJUDXic1d5udHf3sO8+n4EmuaMe
         CrGztajNak2mFxldooKKy1ovLurX6t/EJ+1Go8KCCiM2gBwleVD6Mwwk5iObDFCSaGta
         IX2HWIOxPLLDPeZ6oYW9jo0WVrRljI0XzeOKL3fy5tHpz7BeHxgv7fsyDpvuUeAj9axw
         JCCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOQ9MGiz7Aly85czwpcsS6ECvXPlOfOWu8S1TUKODcyjKrT+MzPhK7peaJqqrE5J6bme5aDOd4xOq2Ouu9vWhhKA==@vger.kernel.org
X-Gm-Message-State: AFuF++lHwT7b8JdqwEBNe3QEpH5Yct9Yo49GVbZaZ+xCqJPc872mM0cL
	P4h3DhSpJuGwV1beZn4zZiRLZrBTCrg6LDD2mQd1e+41Zs/vSs4+8YOWAG+s1pOr6ko=
X-Gm-Gg: AR+sD10sXBNncoETV2a0EJtGApYQ8t8RG+Y2B9X3/q3ULMh+uzpM3+wwWsP5a+TXy7W
	K4iFV9WpMlUgIX/uj5/ZSCeZyCv5uvJPOvhMtNJB5Tip9dWUKRN8pZav8ffh3zDQym5b4UI9rZ+
	s55UZZG1PvJqEzs4Z5a2Tn6icHNx1cVEey7z50kpZU2pF4eqODX36DAZ6e2r+6SI/bjrDFtBE3W
	cKtGSzBNnlxcAawzPUgKfpoRM69OKWfeP7DrJI45WiTd8HAVYCQF9ZdndpwTUAyZRyP7j23GPjI
	m/Dwpz1EEN8SxgWCyplMwdWA3CMPzaQ5WoFQ76k9R4UGPQPEkpS+bQlULeajk3xl3rPWmRHwcmf
	nwCjEWBUyqJyIPGb5RRpnG4BxHwIwSlKeA7S8c/ECw8LUNhtbe1cKeHfcixQHE8qLu/3UuoyQWx
	bD+tFNYDuZUqtlGB0TnHOoRINuVL2dY0pKVShAHZS1t5j+XecUcflvVsxMgfIL5En77lDoxfd6m
	QmIpGIvd0AuPndZ96z0SmCFm5Hq/ghgV+P2
X-Received: by 2002:a17:907:72c5:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c24d6f20633mr1214319166b.12.1787664404031;
        Tue, 25 Aug 2026 06:26:44 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab63sm1727761066b.50.2026.08.25.06.26.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:26:42 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so8764392a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:26:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrMTVSs3gR2OeQFmf44ErQFyyslsI9dko4qFaaw0sFPdIj/I+os7F1JfmLoRJAGYHhzpT3+lzfoMKOmB2mopIKsAg==@vger.kernel.org
X-Received: by 2002:a05:6402:3647:b0:6a5:7aad:e75c with SMTP id
 4fb4d7f45d1cf-6a57aade7fdmr24471444a12.6.1787664402461; Tue, 25 Aug 2026
 06:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520131206.932050-1-claudiu.beznea@kernel.org> <20260520131206.932050-5-claudiu.beznea@kernel.org>
In-Reply-To: <20260520131206.932050-5-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:26:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6i-ywN4TZS2TcOV9C5w2m+eB2_jXOn+qijM9MJjo8Nw@mail.gmail.com>
X-Gm-Features: AcwNN1X0RJ_J31vKT2WoIR2711Efguy7FqLWJRN03sI7-8E6CO9lNuf4fndEPi8
Message-ID: <CAMuHMdX6i-ywN4TZS2TcOV9C5w2m+eB2_jXOn+qijM9MJjo8Nw@mail.gmail.com>
Subject: Re: [PATCH 4/4] i2c: riic: Drop empty line
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, wsa@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 15:15, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Drop empty line to follow the coding style.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
