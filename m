Received: from mail-vs2-f28.google.com (mail-vs2-f28.google.com [74.125.227.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819A49C4A5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565016; cv=none; b=XMSRjIo4OmX9bGFheJxaua8cjJge9swTjyHSqEkyWIAqkp0oCKDrSS+CE7tk4X5HWHHbyGS98I8gTid9cOYnPbwKNw7R49TBN6AxmTQuYS0z3PEGncjD0ueazKhsc7xx9gHuBJdD8XjtUlM737+L6uasqDmA7ydkA5f4blBeebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565016; c=relaxed/simple;
	bh=LzoyAvXtOW79D7k60hO8Y0fmEyA6rZBKfdqsZ74qXdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfE2hMReCTJn07W3BkbWSsAPXPMQjc53aF5/ntgQz7SFsGRWydFndJIldwxFN3bb7u2JKIo6neh2WyebtLm8DkGrl163xyToVtcuA0VoUrmeipfWjUpwEVRyK+in9Jh8EBcoFNoeJQz69fO2TGFIGhFS3jTdPFoqsJFEDgt0tKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f28.google.com with SMTP id 71dfb90a1353d-5c9031e714dso322452e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565011; x=1790169811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VjFBIrCXQf4je5+QLhXlwhCeUMvFdhymcKdGZkZgOg4=;
        b=oP2qRWVVEoWY29XD5PmCWhuZ+43O+FSm5wndv2aUHIh5HxMbWjnzV6ITjHvho+eH6T
         9XDKeQH5DBUMZq1ot9wg5BMMICoHMUdwil7GEdScFAILcPXJnYOtY+rwcoIKK9TavBSX
         YtQjtKJRWxVBfv23Ddf5QTzyYY+lk4OODo9oj/H1eQmdfrA/lJ258dacDiS1jF9nSBJ8
         Y9Ic/04xCjKHyqRsN12DQHhSm1pGCRu2QRo9dRLzcbl+Hg84M8CISmMgPo/rLhAytFv+
         trT7CfNCwgMnxhUucFiF5LBZn6xChYqMLWC4sWoVU81+R3x9BUhEDPg1FjKGfDhGZ75V
         oLGg==
X-Gm-Message-State: AFuF++l2OkEGNF/PIQ6MonhkrAqgmLnOImrE/eCKSk8GiteHZeyOYZd4
	Udw6Da+goWKB8OFlR/uqIfyLVzOWYhqVBOxBBLQ2fuS7+PdY/v+iIxzU+a1ocEkEMD4=
X-Gm-Gg: AYBFou0AWbqd18dIv287s2os+KjDSwKmmLeR3azw2AJ2JAvJj4eXrlvzcIjgiJmtQPw
	VK0jE+M+kvlAxpt6Q2qR95fl5DwMXaa4quy6nOm54FEGx0vEKnvJzHEJ7LGJJ6W3xplXgqY3KF/
	1VW9fKQCVHdo7QiTTBEsj/7Pkly8cFCR7yz8UumIaDtoG1bDjZ/PGss5Q3x4in1/i2dd7BjuI8i
	B+ETJXtewPvtKzly+QKRfMXuL+VmOoJAz3NrcfJoR6X41PM6xzD+Fky7Fe0TS+0UGfjDFImFfpx
	XZSl1PWLvUTjWw0iAVM/F1iTuuEj4ltgueEvi98q1r0YD8iG1U1fyYmh3kfn2KSUdJcfhbEzNKu
	FLBKNuXsXjSnQUzYpE/C2Y+26NpIKmTlvUnSPjWb7K6LXNXXb7N5IwuNopZ59dfo2K1Qg4B2p25
	3ce+LzIi4X7le8DyN/FRlH6QaozojyehhWCdtZa5O2xY/A316sYbdVST/aRCsRVRb739fKVwZR4
	yaTrrRazSJFIdPjjFciwSh8HO1c9qRHHcblww==
X-Received: by 2002:a05:6122:549:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c99ac7f87fmr2290970e0c.8.1789565011185;
        Wed, 16 Sep 2026 06:23:31 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9831521c86csm2516265241.6.2026.09.16.06.23.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:23:30 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe7so261579241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:23:29 -0700 (PDT)
X-Received: by 2002:a05:6122:8c5:b0:5c7:a3a3:a4bd with SMTP id
 71dfb90a1353d-5c99abf1d57mr2593491e0c.4.1789565009279; Wed, 16 Sep 2026
 06:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 15:23:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1Yad-jV9z47ivY02WAYtOcgnCWVfjynv=zNy+Xcw36A@mail.gmail.com>
X-Gm-Features: AcwNN1XUKmQ2TuuLF52Q7gsi4LkQkjc8o93Y7AoWlIWPEwf6hN5sIOrfKevHtU4
Message-ID: <CAMuHMdW1Yad-jV9z47ivY02WAYtOcgnCWVfjynv=zNy+Xcw36A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: rtc: rzn1: drop unneeded 'start-year'
 from example
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 12:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We don't use 'start-year' in upstream DTs because the driver does the
> right thing by default, ranging from 2000 to 2099. So, drop it from the
> example, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
