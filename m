Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8C4772AD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157576; cv=none; b=AZ8q6e7NZg50iK9sovgqmp4ZGMp0OpyIx4GeaPjA9/MA9ZLnvVgn1j6UzQzXKNW+UwtreBPr4g7CsXEUVBZey5/XxPgwRub+JXMqMe53I2rlr9xW6rwkmY2LNRui0FMHsXqeYSgtX1X2Trr4mektbWqPV+C+O22WWCCcyeeUuo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157576; c=relaxed/simple;
	bh=CFOCKeg4iQzVjtAet34BLf47zzvngdQLba8Dz89LtMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R490R3J4BtowvSxOgcbwR56ltFc9L171tWDaA8R2/+SUdswPIKCjcleDwtXVErKBDgvraDCtOkKfSO7ZmEXRkBBiq0BKw5BuvDdFAQugrzlRfUaVpi4OhVznSGMzwShGj9iQLxq1b9vZJRY9moofMtWtT8PtXYKwq99J4Ss55oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-980b6159d30so212116241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157574; x=1790762374;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZAUfWTzk2vrn13xOUws34cNgXar+RdYHbZnk3nf0APo=;
        b=GU+3j6gxnpNwMe9mN2gPxAMG1DRV3+Z1768Z4FpqKsZEwEHYA0LFwlH/oY62n0ynyd
         PcgqvxC2cacQPiSFMBSGb8Rfqf8F6k8WLx/71DHUfqMQjWckypqbBEr1qV/CJnHSVHnI
         OXu5zbizytcku8y8nGuwp/EVxAChSQqxvRDh0v4Rio5eQoP8yOWuPDLuX1Pv0SF9zq4T
         nvqI7cm9RzbsBA38X3F3z6oylPX6geiluofXCcXtmwgt/ohYXk3UpA4FrBjVOVUqG1U4
         LM5q/If9aknoBeGwH/7I3boD/2EKh9K3DzJWlYHvTzNwwb8Q6xSZ99lJzb4jC9D8Ku36
         ZDNg==
X-Forwarded-Encrypted: i=1; AKwUvByPZAR/m3hx81ywFt15IjSfjtk1Sr4ATaO46857mrshTEfZFTZ+IxpIrMiDSkYcpDo3LQw0SPj5GB4CRmtHqDxS0A==@vger.kernel.org
X-Gm-Message-State: AFuF++kLy6D6iSLRFi7IqB+qqKVS7u///EKoTr+BTzZm08H9g6QYU+nN
	pu9e93e7K9OGdlOY96lyQdIwjX2UgkVm5AdPFINsFDJrIxUJMrZgHrern5sTJVWRhZ0=
X-Gm-Gg: AYBFou21hqBk3457DENOATHZrTz6z06RqKYUWfDmvXrss9M1wqxTH0EOTuozNbCr01I
	f6rMivMNi0yH3AyCgaHYaFQ1sym6b+D6+rG+vklrbFd7NivKWZqvB/6Rp4EXs2GmJvaUNF/OoOU
	1i9gNT0iBdpH1UIDx4QgrwYlAn/Xai8qkaO/VPbX33OwMpxaCPhd1KexvqhC0aHk7m/HySN4bPo
	GfxNhX6VBuVYDkMXFdHGsIBU0L+xzGsDZP+0FHw+Y/oC1oFilDssa7bEEEThwOdRq1kPaWkOYVn
	8QzkeCpF+JRke76OzGiIfeU2AW9P/4RFJHNRXfkyvF1JPWpAB23HnwV4ohrQTizagg2hOLtrGVs
	JY6ZzH5/jVGozFqfYWY+lGx+k4m3fpAR/ZfdiwukeZzMx+i3QbXqmQZv5kuDxWXRAIdjLYkLO6A
	4tvnEbrzEU7ju9KdJyJyDaVzrt037lnMki27y9xEut1BPAy9X4oWl0Gv5qte1Y3WWjQE+CrqewZ
	xyRjZdA3b3pJi1qegkBGWN8LbUofqnrdti2
X-Received: by 2002:a05:6102:548a:b0:799:e1cb:d690 with SMTP id ada2fe7eead31-7ac1b30e31cmr1883581137.1.1790157573724;
        Wed, 23 Sep 2026 02:59:33 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm2646067e0c.18.2026.09.23.02.59.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:59:33 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963d7503fso305729e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwaXxHEy3PpFawsJvwI3fgYqaWDaPGJJVEmunRZpijLSh1kV/bYsC47PmTGVabZ1y9I8yYQC9evTMiPfk3dAagiig==@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:7a1:fa0f:1106 with SMTP id
 ada2fe7eead31-7ac1e65caf8mr1733659137.36.1790157573285; Wed, 23 Sep 2026
 02:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org> <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:59:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYe87S_fEQo8zj_VujmRB5yQKyKCEDazHGM6qk0MbOGA@mail.gmail.com>
X-Gm-Features: AclHuK8WjDB7V2CQNwZO4G_mraK9sglGs33f4ItFn_8kEnfCQnx4H75r4eqopEg
Message-ID: <CAMuHMdUYe87S_fEQo8zj_VujmRB5yQKyKCEDazHGM6qk0MbOGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Assisted-by: LLM
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
