Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA123CA487
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216285; cv=none; b=RUx3a64AB7xBj4519v7i6S5M3st+64HSldmXAYRs/klAP5Q2vTAwcvJdOUT8ArMJ0ACchMYXMy8i6jSromD/dNLIANp7fPI/APXyTkqEPxZsM4o8PJ30+iD1jcOw5by72FfKj3dxJLsumydpAdu8R1iyzuvqOOOGQh6xR0+HO9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216285; c=relaxed/simple;
	bh=+pwWH0Ylj+bA4kVRpKE+GiAnMFCJcAphE6wSuMx+Mx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecLWuykKI4vSWS0vlco8LqIh2IH3LzC9ChIG0ba8/ek2SVvekyHfvrBaumNC6yl4j3r3rVySm1c1ibtqLzSFCRL8xR1+CCac9LecLlwtS3WxgwxWWQZeASsPzMBDw7kcJoAfgDdYltwkrNE8KYcOB2NXoPsP14EeXwBEWzbgVYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966eabad303so535390241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 01:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216283; x=1787821083;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lIyX8eZ4F6Ye0rQT1cY+3tveCKsiBumqw03xeQl53DY=;
        b=XSwpEBcZDWpzQTFeTibk6yM7xz4b3iQroZJdxJ4Q/SWM8ewJ17fkjEyU1DWG86eivH
         nLVcJEqmnaHzU94DDMQK2H+p3llQvkPa8JAx9/ML2fmDpaeu/pVWfgzouYV+p2hB747s
         8FN+QNDFZlPgq0+e+kpWQnTtdu4k+/G0+VadoBr8ijepTHXNKRvIwrJ64gTXuKsWUNRi
         K8jAO+aStd+syZEWBoZrA/+jIU/cBXA5AOx4cg+5xBNFhYw5vtNuStMkgZIDyG9fSsSH
         z3lZBswtWKGrejfKb4vwhi801874m08e3Oe0DX638o8mfvAPcl2hY7+HuCAqxLgjC/uJ
         hRPg==
X-Gm-Message-State: AOJu0YxU087CuLneYAx7W/41jy8ghB+Exobq7acb+HIuVbP8d7gLun3u
	EhAa2F+uaq6/y3vOK2HSpp5IjydtBDRufNgwZMg9V8pQd85FSdowbcbzpwkg58E+
X-Gm-Gg: AR+sD10izmGQiMwB3KU3q/Bp7TkBVPrk3L0HKiw46522uv59EGwHhcLhdayuSGLJveR
	XqHxhxs2znG27RkqqVkH+UnKogDbbsOnrdvWhN0UWaYHLFnr6L+6BfXCWobzANEHxQTAM9icLDD
	VPpZm7hMa7Vj83K0Ws0yo1F7jrC4/hA9RWt5Iq35Hmw0X+O+2oHYnrRyz296lbmuzW0PsFm33Zi
	Fjl+ULsiUF32VFFwMVlW0wlVCu8hVKZMepVbqJS6YEUuIP4hmKbpajQe/azKqV2LmiBLrr0Ay1O
	tuJgcMRrmUrwtEQQGFX3EqvdhKKRBA0taGgW05luc4TEu+7c7P/cPgMBZ6Zq56v0Mb1gUCyjBu3
	JzJC7INiman39GrvIINHqqerRqPG2kgliphjXM6JtUMLprfOjbNgwefQ2OFxIccEol/7wTCPAH3
	rKeF30l+p+excFqKkwGkyDSnaXau2ol6BzjPC6djf3GeB6IXeelIKoVHjVtSvgrQXGr9zXi5DHI
	Uxo+dTlaTutINE2c5cdCntgXA==
X-Received: by 2002:a05:6102:54ab:b0:778:4c28:6725 with SMTP id ada2fe7eead31-7784c287e9emr3173966137.10.1787216282700;
        Thu, 20 Aug 2026 01:58:02 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e9459d3sm5315964241.12.2026.08.20.01.58.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 01:58:02 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso723791137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 01:58:02 -0700 (PDT)
X-Received: by 2002:a05:6102:8555:20b0:778:459:f0cc with SMTP id
 ada2fe7eead31-7780459f1f7mr1814844137.4.1787216282002; Thu, 20 Aug 2026
 01:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817083046.11935-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260817083046.11935-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 10:57:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJq382F+aRrJLBHx9hBJ1cpzJkuwry=s8aBr+a_v_e3Q@mail.gmail.com>
X-Gm-Features: AcwNN1UvQlkgAamNiFVHBaoN5yJQh83L7Pc2pSVec7awxDWPpdL2YKJFb3rej_s
Message-ID: <CAMuHMdXJq382F+aRrJLBHx9hBJ1cpzJkuwry=s8aBr+a_v_e3Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: fix reset handling for Gen5
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 17 Aug 2026 at 10:31, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Missing reset_control_status() support is not Gen5 specific. It depends
> on the firmware used, if any. Refactor the code to handle missing
> reset_control_status() more generically.
>
> Fixes: 87e713f20048 ("i2c: rcar: add R-Car Gen5 support")
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

I reviewed this a few days ago, but wanted to postpone my
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
until I could add a
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
too.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
