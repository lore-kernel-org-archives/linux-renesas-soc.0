Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28396421EE6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683876; cv=none; b=XdH6iCeYvQztxIHuTl0BPNI20PYAlQufW+KYEUm7yvv+JvrklzQjqEm6+ZIqDz0hZXdD8FFM6bSnO06hxpfJDpX1uTcuv9744gmpTz3pezjkXVULRl8pjg4zJwVv9uwJOyEcSTh0V3REsfdUE++5Q3vrI0uuoghbxMzBXlk2YGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683876; c=relaxed/simple;
	bh=dL3tpsuUntKxbUUvgg0wlrIm48VH5D5MZof+IUXcho0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXDqtk/pb5kPtUlDPXpp/RxLQq51jLbTI8/9zgQGEVZoPJyaia8vR31SB2qtwrFVrm9bQ6eCYdrm/w11jm3KLkUzcUTNdHQ3IfJGqsgYFNh7I6YoRlC0UA+W7J+oyal+OZT1H6LHG7VOxIu2nTC/r9cPaGqruTFwdYiTLg0FvZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bf8a2932a3so388097e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683847; x=1784288647;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y5ZRUNCqj6NZWBIJRevARucfFBuDZbr36nuloNIDCEg=;
        b=KAGFKTZjPXAJ0JGO+1LOY3hi8EN92JufLEoYThLhzzA2meRTIYptuMl+YMLchQfSin
         GqKwnkMhEbQfQ0Ha3bJiQ4E8ACtNgWLbBlayWcC6lGXO4/0k9Ze2g9AVvjrnMCvV6ft9
         Z2+lJ9R6m0xq4AHso7CqoTBR0PBGuW0h7xkFUJM7vDdiQMhqbbs/SF4QqVP/7ChAULyW
         6DsDUQiRIyiRsG1qC+YXawJS5zXtBgi1HOMh5ZXI+eM62QWuu4KqwLXVP1ALa5geqOhv
         7eMqSwe9cDcLy9mlATSaQpGyZ6isvq80LA8ES+fh+ZE6NXRVsbMhMPrf7PeFKVnlkCcJ
         dzVw==
X-Forwarded-Encrypted: i=1; AHgh+RpsJnE/OZ5WwMPGeKo23hGV3QP2szfOimHCH1TFZxuZrsVOkYAkrlkclCVVp4F+cJlySR7fNyBe2uFyi71NSMrylQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJG3zoXS2gYjZy/WFQL+E/LyfpMHV+8e+36R9LudKa897qQo3W
	vz0GivVQOxsqHieXKLXqDnBaGVm5KK+zwV0LCy+1Kj4Hyx8LCqEh4jkZks8RDztfPNs=
X-Gm-Gg: AfdE7cly3lVfKnYNNxlTWJETYDJEsX6q16vsXV/7JkSCXiJ/YtCeoTNv2EiEKmn5/uE
	bG8dTsFo6rNIGFZnZa+ySfov9uVCWgJBQtRhURbutxmyQGtgJSwbAE1E04YlXKpBv1jacpy8Dfz
	9cYVMVQjR1mmWSnI6Rf6kMJpzTdR5O+Wo1WRbh/SZ6K75FmOjdqlkKkcrQnDBNycyM6Qh+qEuEy
	HHVO2dLAF4BurWd0BTgUmwc8FcZwfipJY/aMXY8VxpaSu8DLaxU+N3ZJ9vbYb0YxQ9+9YRjvS3T
	yxuwp0zClIa5fuTZapmvpALnmSyNFlDLrlTZ01LQ2RO8XKcorG+2E17IdTE+7aiFv5ko0L1Duso
	sk754ejVLwcIHgYwLV7EU6c0MsFfhv84OoiDUilORtFN/BVptOGy8eiZ+h7h4YeQV/oQDgP3Aok
	6K0JUV0lO6//3EKzidLF6fAgl7KbHrtOB7+/icGkbkREaZFFUDRg==
X-Received: by 2002:a05:6123:4b:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5bf75d7d4b1mr6515771e0c.5.1783683847514;
        Fri, 10 Jul 2026 04:44:07 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f8499f8sm5570452e0c.11.2026.07.10.04.44.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:44:07 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-737de52625cso421077137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:44:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr4kxPhF70WGVSybTox/Ar7v9JEfnyVe+qRXu0DMEmBQtQkg1BVXcveD73yBQxV558rgXF0OOLO+1qk2/jrtWjmXw==@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:738:5e0:b40c with SMTP id
 ada2fe7eead31-744e00910ddmr7236987137.24.1783683846883; Fri, 10 Jul 2026
 04:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com> <20260707145135.247565-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260707145135.247565-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:43:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_S-k8vJTYcwq9Z+xn1MeFEUykZmpTN2f5fjgMSHiS0g@mail.gmail.com>
X-Gm-Features: AUfX_mx5bef4KCy-t6rEqSQFESUXpdTXkFdBdZ6M9KBRV6SHDEbtexpDvqz1hLc
Message-ID: <CAMuHMdV_S-k8vJTYcwq9Z+xn1MeFEUykZmpTN2f5fjgMSHiS0g@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 USB2.0 function support
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the USB2.0 function controller on the RZ/G3L SMARC (r9a08g046l48)
> board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
