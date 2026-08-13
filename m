Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C51148CD4F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635520; cv=none; b=S6R46pMmPhOLSNRFniwrGQ7TAN7DN9Gg+tOvLJWFCTaBs4ALes4snqccIrvyqyXmeloR9DQ0077f8u1inIf3bsnVcAkSHVGbWxjz3bvjD7mR5MsZMuw/EwekWYqnWo6r2kulClSVZAgeU0SMu70NAzm0KUTxuch7uqA1dcuqfYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635520; c=relaxed/simple;
	bh=k6S+nF1N46l3nOYZEqyctylLIW1t/PguGUfiU/kfXJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSvXC60aUgzHJtpYPtijKJRAC8inlfzDUtsRubRFByCWDVdikZgA0ckvaDkmbWfkAaIew9pQERkTwYGXcPnBGylJC3knqPOuqNbodZ26U0Lg2q1PH0XcHp9q5TxsSfcuMmFpJBWH+6IGF133MBLIFoC43QLR/sstEsQacRXbgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so2945034a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635509; x=1787240309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQZB5Vbs2uVneosoReOIpi44y5pPlIBq+1BJ0pK0+A0=;
        b=JKgFLuRuhCS2DL5pz1KNw3Gtwd7fR2YrFb1inDHuwqynzNLf93jQfkyGv9qcqiNbut
         QqFRjD5h0Fv7nIJdBlPHdQ/1K2/h1iSKhyPLOiqo1BsoxYpad/uMnm4P0202GN4CCj2B
         w8TluMgizU5GdXsZ/eSjQBB6pkAsmi2c+gpjkE2WNKASlAfoUdQMrMQv4Slh84IL+5Ja
         hu38LAVWRdfstDewRYnlX9xbqfUWGjC8SFWVmep6VSbKkDRrwz0eQsKHtIoQiitF9lNK
         YjEyTkwMUP6HNuPPFSsnYOO3IZsVpnVtumE+pOGcWJRUZkotdywMlprUV7Q5Z7wevgEO
         7b6w==
X-Forwarded-Encrypted: i=1; AHgh+RpqPNBwgeU9H0PkyMub0IoO+CBH0JQ/me3eBsiCCtl9O00RKRoU8OI9bPpVF5Uo6E+X+EGj/gQRXY8ssBdFVTwEdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLsT1lcLI3c7x0PJR1/O+hAxlUSdL3VhrW0rIIJQd+VVUImh5V
	w53sPL3XQF7A+0kVlFJ43HwIaiWKy2+8Of4YFpwO+svt3Szi4oBfBq6pLy4RrlWm530=
X-Gm-Gg: AR+sD118GhNwVY+to2LbsWySPoo76SajRB1ABwxYM/ajDBHpycoEWppyx+Lqvh+syw+
	74a45SLRTwJnBjNJEG1F/795B0noPmDXfms8nqs/xoKGb86j+lEFMHGHlh/eFhzco1fXdJvi+X+
	Fui8uUxajs9G39BlFlV3bzZEA82LSv32t/hqr5ZYrFDJZNg+NKHbcuhc9kPCgPa6MM6WGeM8zP3
	H4winuaxSTbeDQ9vtT6eCXeD5HrGH/R4vQr5PbeItthkAFMl0GhTcms0IEfmhxQmZlpfmKXe10t
	GAItBnK5PRFgACzSyNTCPH2HgJ+32Rst2LV411mqgz29P/mYDKPaEGy1WLkXxhb1sPTdDPZ9HZ7
	pftJihOInATUit6MhEqVSj6wVh9q0LSPzGziITx3+12U+/e/z3mtx//XAGYFAm+QMVI2GD2kQhI
	6QPjN9FddLOzB7qJ/jfMGvG3lRfKs9Qd2hwt7/KpbI7oNPueTxxli+szRlboBDPm1XKgc2ZMsE8
	VXlrF7cHYZj4AmBQ8nHDzPHfA==
X-Received: by 2002:a05:6402:44c1:b0:6a1:f95b:8cff with SMTP id 4fb4d7f45d1cf-6a3805777a5mr2929212a12.1.1786635508710;
        Thu, 13 Aug 2026 08:38:28 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f7f59afsm1098541a12.11.2026.08.13.08.38.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:38:26 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a8d251so3001961a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpIVMd1qb30EL6G6JHcUsbrzZiQtw4NsVqrCjtITtFj9RRkkrnbGCLDxRBOGRUzqxG3sSU8G6eQdJKzlGcGxIQqDQ==@vger.kernel.org
X-Received: by 2002:a05:6402:a0c6:b0:6a3:6943:d64f with SMTP id
 4fb4d7f45d1cf-6a38057796amr3391764a12.2.1786635506209; Thu, 13 Aug 2026
 08:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:38:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXx=Pc1jM-u54kJ+_jBJy+-hSX9r8wj2+grLDSfrCkqOw@mail.gmail.com>
X-Gm-Features: AUfX_mwU1q7iAxt-3a5e9AYUA8dMo_UbwN4uqhVMSa3bBY4klxKTW7hgnQosl_g
Message-ID: <CAMuHMdXx=Pc1jM-u54kJ+_jBJy+-hSX9r8wj2+grLDSfrCkqOw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
> 1.8V. Document the missing 1.2V power source option.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
