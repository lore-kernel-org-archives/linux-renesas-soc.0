Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9720A47143C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331027; cv=none; b=lHrkeKNOtwCWj5K+imfI5lJPnm1SbC2jJ4h+V+RRZcK694fjAvBhTZoXnERsWNOA3QcmU+AR6Pj78YhWDPkOalfmW8TfvpBd42ft6IFyiFpT0CTdAjb1DYPqEFLJr2+7HySRoMJEYmxdX/KLFa2q/WAbR1QENqKjD1m0jWyrXzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331027; c=relaxed/simple;
	bh=RrTRHpycL8I7Hc4JCwx5WcZIVQ7SjSZeCq5n4o+MG/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoXgiKx0S6yjoRLQDsbVUDrOFlkgDdTSsFswh0Nm1nzH1BN6vTLLHQDbcsEWdUR5VB83hWPia3aV+R8R5z2TYCrfmcgAqzwwzDxeAD9ipOspXuEVjJySOrzYJRHbl5Q+uPeqDG47EtaGwXBTYFjKdcX5otGUpwF4o+w+pUPWubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963d7503fso223449e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 03:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331024; x=1790935824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KL/MQSQ2ufa6wux9YuL+tzjixJQA111EVmHyVach6lM=;
        b=D+WRA595umexpj5R6Gh2xVZH5GH5FL4OdVnPDe1vA4u3vcRCxjF6GoCWprmRFQ5b3D
         kKiLQ4K3rjI2VFILNIsCvJiCF/NXXMYL4X5LL/XjGWcGY+EK5rhffFJ6StQkSYjjYiOa
         SN41EFfhaoIPTcs7INGgKEz81xNXoCxQ0WCRRY4YAScdj9M1PkfQu5jE0CpuAIy631u5
         P1YTqdss5RLgmgZ4rNv9H8tmzrrlTyzavZs4Ii85nAwUArVcLSUNHYd/qtb2PQl6f5Fv
         gB7ckrY8tg/EervwdbIdiuCR0gZnF0P/IyLK3achFXFJg2sVLAyYATktFmzVrGmJhcb9
         1IpA==
X-Forwarded-Encrypted: i=1; AKwUvByVV6K/7Nf5dOWnbeoyMQH6IbJN0ae8GxtCG1hMjlIJlH7zEC43McMLy/8JKMruPa4cTQkI9FbJgdWZ7m9w4BQeQA==@vger.kernel.org
X-Gm-Message-State: AFuF++nWTjIJUWVIkEExyLODFrrrSgbFyaV9/V/zs3h3J+iU0SdHIgEK
	S3Q2UgRvCtPp9EjAnm/nkMIRvuZTEvMpY7bw+6HVO1WlaxbQyBvaWDecZd6fwDVn
X-Gm-Gg: AYBFou1e8Ug+9niCJvoHU7GJdDCGNKznZZiNc4+Sgfd1zqJPVsAfKwv0kbikhOfkxaA
	S0NQES3bdOcGqKloE08QRNcucdnrGvy42QLs1CWGJ8NH2Mx+OR9iT/BgL+IjUXGTtclZhmNxert
	CuQTRmygcywfY+VjaHf5E5QRqgBxlNq1+hRPsiMAYlXBSh4jep6vJ/AR2PpfHqP1t5+s5+GA6o8
	0UN4Tb3Fkw8q1/1CLpRDK+IIfE4zBCsEPAT1Dtm8dWuU7MV1GqOtZPN7zJ5Egg/tlUuGdwnOZag
	ezrDbJP4j9qDKzvYYmGCmCt/hYTA3tQcdQXGyJDkFHR4/Hro4IH+jCC8jDabZ5v2D2BTe0X9/SH
	gU1SQMkrvYyWixJiCkdO5nqxoW+F+1/k1QbTKqkNQ8vQzrDhxUgbWrspvKrqkt2dIN8fwZe4P/z
	5PIxHRTsfVE3y+0iq7LO0u5/85HhSvMgdhp+qYHQwsO4aLtE2a9Xa6Na0g16AS7rkim95Z4n2uR
	vFQNE7Xx0U8WmHXnqdM6853ZwO9Us+55QYKSw==
X-Received: by 2002:a05:6122:218d:b0:5bd:b2e1:e1f5 with SMTP id 71dfb90a1353d-5cb09121fd6mr2889507e0c.2.1790331024444;
        Fri, 25 Sep 2026 03:10:24 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cc64f9c59csm2131946e0c.11.2026.09.25.03.10.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:10:23 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98334af2ca0so232779241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 03:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmhM0cVg1kDblnvWBfOdATJ3T8T6kVsHk427KErX0cnymU1lHHS+hoqxPRYpf2hQ6zPsV8wEfpDvJ11Q5DM2vlig==@vger.kernel.org
X-Received: by 2002:a05:6102:94f:b0:7b2:c201:10d8 with SMTP id
 ada2fe7eead31-7b2c2011359mr193571137.3.1790331023332; Fri, 25 Sep 2026
 03:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com> <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
In-Reply-To: <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 12:10:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
X-Gm-Features: AclHuK_GZIBSlb8NwsZCACC-o3m-qOuhGKB_o12zs05PvqCsSGvUGIOw-t14e2o
Message-ID: <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Fri, 25 Sept 2026 at 11:48, Dan Scally <dan.scally@ideasonboard.com> wrote:
> Huh; not sure why I never followed up on this. I haven't touched the board in some time, so it must
> have slipped my mind. I can pick it back up and address the comments, including adding the other
> interrupts.

Same for "[PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0"?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
