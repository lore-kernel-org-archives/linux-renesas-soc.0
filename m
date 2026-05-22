Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB54534A7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779462400; cv=none; b=KeX8SdIL8r4EZyZIC+cZHL0iIvktiLdu3GiqR7QN46INL5HszsI3ntlXH0kVzSY+WU4oRtR0FsNUtftrd+54iHYwG13IFFipE6CPXiclyfePRg4VA2q4Y+PEUZgz+0Vu9WuuOU+YddVRtxLfkrNhHjGHJOV0T1eGwn0KHllFzHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779462400; c=relaxed/simple;
	bh=YgbrNtiNRiHgnehgrmKfGsZ1TgjusTsRTd7TJPZeI24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjydrbiTl6164JAKEmQXb1M5TjsdNUpYPjBHpgzWKIsrq2RJeEqI0pA9gHJYr0j1fwdHhBVcmkYCkIr2iy6hbvd+0qDcevqzjp9IgyVmA9TFIMdsvAEmyrR74t1Tiq5fEGmOQurlfVWyorrTtKCjDHdtgoYXWrCbvbSQtup0dtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so1262801066b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779462390; x=1780067190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D06wucBqM+wFrpicTrkexcT3qxrusKHuYyn1j/Vyqhs=;
        b=gEFqpI0EnxcpX1WkEZ09ISV/t/11ulJS23bKxRz6mSeAyJYhU/Rr9m6aqGQXH1wKKP
         PET18vIpqq+RhRIF/23XoQf1TC5URv8t3hzNQ6bAdap6E26vBRE+uRn7kMuj2hXV0q73
         qsFohagSTLLW7I/b6pAIW2Y0lTIhIcJ1E4Q/81cLrZODlJ0IKViiraA82PLujrZvwYVE
         byewoi0YwzID1sxzDFDQXOXP9T7rzBDS3+BF8cp4tbhY3w/shSNvRNf7HDTA+WWtULGk
         A8ilLRsfD1CiUVGMY4dffwqovAY+Fekz330JGdxFZD6S8aoQE1Pe+TbFPCWyueDWVgA1
         aEJw==
X-Forwarded-Encrypted: i=1; AFNElJ8eqVN+8vR4AmaJui0cx9KlUp8p/PpEZ/7NfrSSYoauXaixfjoC+NcvURkHNWb4BbyfSXoVaUcvRlQkdordiTRfZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXp5XbVBrk4X8WgE+ndCgIBss3QPq4jmpggPuCd2GHmAF4S6Tk
	SJOdZGqfXdSLmmnkEryAUOB3vl18ILFGAlQZraYX2YnPm8xmoAH3Yve2HTLKxepxqfw=
X-Gm-Gg: Acq92OGd6uQLcLmiJy369XR1lxVl2P43g7I2+9/qC8YUYm+vFLt130RVBv8SVv+qPxD
	O8XhFs1O9YOR382nl2mhj6OlBEV/pBGIAh/4DAReN/bB8xl+dtU9HF9A3Dw6zI/HFZ797oanHCb
	tgDtF8BHI2nEotpAqW12yNgR9p9I1UE6Vm3e0Mj9rd0F25mX+HFP+WIyTPhAZpb1nOPfZ77Yo3u
	m+T/InFBp6XfoKZ8Jq3ewmeoz1P1iQ2qU9Q+f9eALEyMuyXMREziKDUsm2N5GQLynu0oa6o+VWS
	gVvdvXQXWmu4FBDdVY52ry5NCWZ/Sn6BXjFndw9ZmtZM+dVAG4XqDMKl/D+bsaZtn3ueY2E7LSN
	D87Fm4o1Tb+2+v4lknACuR0QFHr3b2ikEdHZRtTBHPCTpHyytBmXCyHYCchcAFgi+H80rfHjm6r
	oMpunGbDQDRvA5NM4bQzKLQqLbBSD9BCp5fuZGbi/l9sRe2VK/FRT9dBfeg6By
X-Received: by 2002:a17:906:9f8b:b0:bae:456f:fbb2 with SMTP id a640c23a62f3a-bdd276d29a1mr266134966b.23.1779462389095;
        Fri, 22 May 2026 08:06:29 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3050fcfsm65565166b.20.2026.05.22.08.06.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:06:28 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso12024141a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/xD+FY0UgaXQSFMPVCpHmywiveWeQ0u6LiF/fBlZgtb5R9CBvaSeE+4Pu0fGI0JQag99kDPgBMIbiVxRYkbFzwGQ==@vger.kernel.org
X-Received: by 2002:a05:6402:4348:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-6889c406b3cmr2003869a12.3.1779462386158; Fri, 22 May 2026
 08:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260501105116.33452-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260501105116.33452-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:06:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5K+yj5pwsnMLoKC3uJwoGMVLFYnmhParV0-XYo3utGA@mail.gmail.com>
X-Gm-Features: AVHnY4LFy1qvD4cKf2yzXjWCfrZHxrepOR8pud8zw9yyGXeJVwOrryJMo0mRUKQ
Message-ID: <CAMuHMdU5K+yj5pwsnMLoKC3uJwoGMVLFYnmhParV0-XYo3utGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add PCIe node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 May 2026 at 12:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add PCIe node to Renesas RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
