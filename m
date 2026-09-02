Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F3F47CA80
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349553; cv=none; b=Pv5q0QdGJdQaFWm4eljOhBl+N4v44ivU8o8nutQcT7dDFmGBeqZWBx3Q9wRqFlm5dZlGNLtfJilw7uW85F1b10m+V+uVjaVAnmITeTgsMg8s1PrtbOgpS2VpYUhYJIBqVzOiqw44i2x1FRu44jhK/BNTOqngAVv8x6UWbrYGoZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349553; c=relaxed/simple;
	bh=GrBIm0BKS+Mu7/OLWlqezUi4tFJ6U0Srqj6VjLPOZaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhplEFbHkzL+mYGLyPRvQERjSLopMBGB4DYvguoWuzNMTgm187vrTzBd32EPGQkGsW5M4l4v/ZHw5i/9wyLybObWLdEmEHWxMThqDsFiqOjeTYqAt16Vore11agV/CsUubUGFzONzfo/r2VR71OR2oELBEOXiVO60S7t6BCs6sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848643382fcso1043202b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 04:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349545; x=1788954345;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XEAVGW99jRYpfKK+i5q1QjOfB2bMJtHxW0mUFyR7MIM=;
        b=aqIXhjRLr7SDCntJEkoG8qNuOHXRdG3Bg+xQKIhnX6fUjR6a2M8PhjyxwwMvKyCWRW
         A5pkpgi9NjXq7OgRNVLJhB3oHdK3Jwz87d9Ib/SRpUi8s/TPpPOmowN1oHNp9ojTWAzl
         j4dm1LUkor6w1dQjugR6suHO0sN5FTsj8NoFtbSUGbclRfL8eHtWBCjtlOSSr5gbCg0H
         4TnXZJbuEQwvyUIpnEFxeHsvCmm1v3O6ATtNT2z+DZ8RxGTc7m33sSxzNM28Sr6LCxcx
         wjkSh68hGxAxfK6SsJ87+pLq9OLGtE3YhO0pSTrdBl1NhqD7cbjdYZocsSCIoq9NOC8e
         XewA==
X-Forwarded-Encrypted: i=1; AKwUvBw5X2oG3AU+AafyK7NjGH+3+t5i6uUrZRGU2Hyqd55IVPH8v5tOlbvHvEchSUNW4diIBKELbgEh6IgXZFrvDvvD/w==@vger.kernel.org
X-Gm-Message-State: AFuF++m3d4XhCJJBrjv11m2btQ5pGugibn/R4abyb1wpXjcJPrkyhrf/
	TVPim5uHF/aIg0XnQNsnFQQL3Vo4ihEjPJ7oPBnPzftsvxZROMQMQlC75ECjIBLF
X-Gm-Gg: AYBFou2RfnxOwyJ9/qgNbN8p+DiqzRzQ0abrhDTOxrsYwAS6mJF+6UST6MVvi00T6RW
	X1e0NFcwZC5+Oscw1FQFbTmUIXYsR10PJiI6QuoD5G9zy9sZsSNIgJcF36EygF6j98VJnWoo3L+
	8bFnVnoCX5nZESzgrXW20l1EL35DS4ZmPsoYFD/K7U4NuOBqkZt5r7sSiBO42iNtw8dF0wQsJx8
	i8oiRp53bjU8DcEHwttcduk6OexM1ybJZFRwB0oJBBK5J0Ggtke7Ia8tCM1sqEb1ryMHt5MZqp1
	Q4s5XvZSCKFBGvcfaQL1C8i4Vore2tJg3W9YUfjrVqVARUn0TjpmtIHHmaKXfbLVH4g6FlF1O0n
	P40Aq9bK1/QiR7wbH6T7zF2VZhE27dOzcQEUSNVue2mPYnOitSn2wzC7Eiya3Hq/wbeYJxcHVaX
	t1vxr65IOJsBQLb8uTm/3O7Xz7kmIOrYBzzg771/K20H29MXZXDxZrIGk4gNWGwz9RJrG03ghEX
	J947ZVf/LFVS9SjjkgyuzlEcqCv3w==
X-Received: by 2002:a05:6a00:4c86:b0:847:9015:e68c with SMTP id d2e1a72fcca58-85ed3f70278mr7342463b3a.17.1788349545323;
        Wed, 02 Sep 2026 04:45:45 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f80bbsm1218800b3a.57.2026.09.02.04.45.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:45:45 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d7195706f1so9949145ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 04:45:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzGjVf/1zNkcYt4IYxOp7waT9jPiAVk3pJXZzU0URvWpf91TN/qQC4KizdJ8sfLbn2k68SVgVQ8jYNLBucQnljJg==@vger.kernel.org
X-Received: by 2002:a05:6102:faa:b0:785:bfc7:26f5 with SMTP id
 ada2fe7eead31-78a1f33dfd3mr1197143137.12.1788349174855; Wed, 02 Sep 2026
 04:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:39:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
X-Gm-Features: AcwNN1XYp2AmohzI9M0wS5P-4B-ztdbPdhzMYLGxaK77VTrG86b4xj0U-T2WG1g
Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
