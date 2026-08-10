Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1010928C037
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373114; cv=none; b=Sg6jQpN/ZVpge8h5JCqScJlWDDWCpl/fCfvPnwJ2VgCQqYCH7+VMmkdlwhj6S633vdRoe1oIAplwO/haBIMV/N/ZXMiLQCUmRIot7niiHQCpy4SJBq6ocZd5LTrgAgszyTBpfuPZOZwYCpTGFgkXra6MSHadxJ5q0j9UI7icaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373114; c=relaxed/simple;
	bh=Bnwp9jqVKIAfs/y0mpNAldN8/vl6K6VBqOAFBG6md/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsRDgoxFwbWKzVEUyQMUQwFWBevppR75x4Rudq3tOB2P5SB8IY52rtafZOp/0vkR8kZmVU+dmTiK7FmcogW1vpD2wpgPj/VtpF3MTl9RrPbB5tMXCOLR0vm6jV5jURe72tcg36c3Zj3Sss5VkTa6n4W88U3Kypb6d08uu9p+J+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-74a86e9d4a8so215064137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373112; x=1786977912;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=;
        b=hqk4C/ysSQzneahZ+P/A+SQ5NsRMrVRyC7zIKEJeztZ9vZZxtQhIz1lZMYFAbubGak
         KypKZiuVIFGtSSWGjHo2z2a+9D7nZh2EoiOHxL3ETgXex1Y2zpLeVMgT5cFjz1wWmtyI
         fZd6kQEAmrjhBHMBcFPCpjzucGcryySb64Y1pEZESCsRjqCLuqZ0ZKiMsv//Ztl9PegW
         eHWQoLmC2YxsZXnyHSCQcB1gYzSQfnFCfbNB2x73XaVqy9Jxd7NPT9t61kGqasvAbuUV
         XZkKWsERC5lHA8GHCxyb+jk9B8P6sUsIZH/ZAeNnnG7qaU8PThPK8v2zXuTKuCsI0xHj
         vGdw==
X-Forwarded-Encrypted: i=1; AHgh+RoN2vpRIKQvZY/cQRtmm2qzT6ne4pRvguYpNG6bHoMXkgaQrsNJmnufwT978jsf5p4div/+WuMmnsKdmW4beoP3bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx8kJQdyuod9TWlYbZF6C5E2UylLt2epC6XJzYHTPoFU1DWcNo
	fmkcbSed4ruhPzcde8Cl/xDSM9l65RoEudTlD6L70IKFeYTHxN/B1aTSQHOQFLGO
X-Gm-Gg: AR+sD101hHjm77kw4TSSnonW5dspHSK3Y4ntK+3NffFO0/L9hyMzu/ZKfAVqMNP1rGi
	VKKA7b647CIZjF7baktpMCF040TaOLpEbgZmVlFFmoyJ7qlhpZSN/dTHWTQmWkvTjTTzHI+f4h1
	L962lg7gBOG88C67DvkFItyMLgXa74XGT0L/0lNF+sgg1MWc6iQY8IY0jH8CCu3K/c4sgsRThKU
	XsPIsRirYczOSfUf3QMRLbSO2F0K/9HSDN03BH3Dz+/J38m1dcz0jp88B3GsdZUn3c/jUMKXV3X
	8QAVaDo2i5X//QYxsfyOQ6lFjvgmEX2admDVTCDCV3zLzzIPPkeppEUGhP+BlPOlFguHqviIHNB
	Zl1vT7R0ApM9Tqj35kGdGgwB49xUSe02CoQRqK6P+qfYe9SXjD5OKeoCy31OGss3QwvyVHk6up7
	xhbbl1Fv8FMYFsJ4pbkLkty6w/EkTchxF8dk1t+ojK/SBf1e6E1aCHxxTip+CPHRcidldopF69M
	Jkhf0Tg3Dpmq2HMu/bgBMGzJg==
X-Received: by 2002:a05:6102:32c6:b0:73e:c6a0:331 with SMTP id ada2fe7eead31-760e852173cmr10255239137.10.1786373111701;
        Mon, 10 Aug 2026 07:45:11 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2e53fb5sm3627471241.1.2026.08.10.07.45.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:45:11 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74dce749cc5so172347137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:45:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoRPqMLyCEPWh1DxsUIIMkcJuzojndFEskS3VHS91oYCD7PqqGSYwZLSGeg34Dy/WG+ZHr5VgovmGbbr73E3ZJ7vQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3e03:b0:738:1fcb:f276 with SMTP id
 ada2fe7eead31-760e62c939emr10465315137.1.1786373111117; Mon, 10 Aug 2026
 07:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:45:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvPtnH0WUjp1+jTn=K9=RCydq8_O2Ri+FfedcanRWV8g@mail.gmail.com>
X-Gm-Features: AUfX_myZKLorDtb3K9UCtKfuAHnzr1O6LnLSBddvAzpsfFWqwMDXcCTUWFrA9oc
Message-ID: <CAMuHMdWvPtnH0WUjp1+jTn=K9=RCydq8_O2Ri+FfedcanRWV8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: cat875: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
> (Hardware Reset) states that the PHYRSTB pin must be asserted low
> for at least 10ms (Tgap in Figure 10) and the system must wait at
> minimum 30ms (for internal circuits settle time) before accessing
> the PHY registers. Use 15ms and 35ms respectively to provide some
> additional margin.
>
> [1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
