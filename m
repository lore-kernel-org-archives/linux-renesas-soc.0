Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A8481252
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jul 2026 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635861; cv=none; b=RTXJT7+xGgQCI/u7c4MBRANIdWKN/ltM4C3H1pV/W1/DokLNkTURuB7SWhI8sI+UJjv3kCObwXd6KakiSfQx32TBYaRimmLvCFwBzO+7ALM1Rq4xlCRoTycWgpJQ76DnyJB4GmkuoJ5CzxFP3JCwD1dm0/GgBuf6sWW+mjhfrg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635861; c=relaxed/simple;
	bh=Ok4h5MuNFbiAwGJVEMYjwsqgAPQuUHpRhxZV08QwcGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YDkEVhIff9WfArH+HByIJvam55mJ63mjr7NLedcIClOvdV1tfzFXrVB+zpl0Hsymu8wFJic8Zfy/Taeh2HIENirDQqriCnFOTlhIySRIgWrMKeDBUPPN4ilT0Cl7gcwvbpuQSTlDe4M6S0Q9RY2igkVUP0GWuRU0fkV05IQ6CK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lppMKQzf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lppMKQzf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49553515a8bso33238465e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jul 2026 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784635858; x=1785240658; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W/Sbmym013BRx32n0veQZDCRWz7mq/KeTTSGYGX5YmA=;
        b=lppMKQzf7nCdM2+2jI2mMfbWVYbjISP1awD8BO7C1e1kp6whF93sCN0CiZn9yTtAfS
         WQWoKvpM4G02q106S+iyRfTZdXrDm61CpBA05HH7tEI1jrDtxLXFnQt0NxXMPK3GboQy
         cIJn8Gyo2C19x462ed7dr7r7YOWMVIOpNysZHRTVha9YKGSzCcxB2NSobzOwidMgZlKp
         cr5IT+4eRYKOw3zEjDfd5pR9WOJiR3k9qVFXGeGyV82PhycMM96pSeyL6YlsBNHznFhM
         sYVHHXwpL58uakrZGzOk5ZrDVnSsSlHEMLqDz9T0l68hhJfvUITWN4TLUfECeRLui5Gl
         uIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784635858; x=1785240658;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W/Sbmym013BRx32n0veQZDCRWz7mq/KeTTSGYGX5YmA=;
        b=H+1JcZ12s1KIdHRnDOcneeSbuwHRh6kMhZhRJB7Kr82bXAE9vvsEgceyigRLP7vRsu
         +66vn62mWHV/b0h3d2mgaxnzZbcmPWQ8KTvElJk9PrkKwX95jSUlKZ8Rc27al0B6xfrT
         +BU2Nk5MbxanD8mkEhzS4f0/w7Lc3rIY7oMpDs5aUtC5AblmuTAjycyQw7jYSbx5Qfr1
         tAzT3heTI+rPDPV+Zw+9kcjk48UJ+JOxBsES4ovPmat4XjUL6/fjodkFspuj/yiH7Zkn
         Uhuo0w2X9NEtcBgqsV7xOEcfDr8BR+o5JelwWLE/58GmzIyXF9EWx0cmlgpPCSYVo+Hj
         GfUA==
X-Forwarded-Encrypted: i=1; AHgh+RptN7aWL7WaakW4gq3TOkRgU7Hkb0WElwnIkvywG+KjV96HAVKLVGwDYAtfCSMx38Bj4Kn/6Q0mHbb8LBU5xpYNCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDBrfyiEDcaiqpUohGxUy0yp/rMaoZ7UkfvoOExbF/cJg8Aq98
	KZK1aJfQTfIlBAzhVFsT0mqFyyjjEymHGV47xECNgzUeIjoBQB2K4S+xYtYu/wHP6Ow=
X-Gm-Gg: AfdE7cnBc958e7FWl02BCSxXBNS8+ZO1U/XBZxaW8w4XYPAskSKS7XrCGunyg1K23rJ
	AYxo7IAbWnK1wC9wPKh0cOSYx9QMUMCC2TIjFWG+3HK0JBdYN0eXlFyh/DFyWZABCD+zPz8TOZw
	RsbrG8++fcJ4720P55hTbUucwiT8IFBAoZ/9ant4QNyTrIHjq5En4nnqKycvyhavcsYwMvU1K4y
	EtNOzneXVSaebGQU1OagTBKpGnXYWjSnt5T1z7WesidAxTRa7/IPXi9p8tTMufmRfRSRJxaV9UV
	lhA7ZC0MRNIvgxHxhXPqpS+F8XhAfwVXDO0qyrcZhdpwUqO7tmt2e67UrMV+nFXMMIJjaoOWAKf
	z+iw54xQ/Lrhr80afxFKLcd7a5kgUgJ/39AGuEk9L2p6LTDKFKQjYIcvzI67+5KWVM9dJZtQMI8
	AAgXpTkMMVNHtp4ZB2byKUCw4=
X-Received: by 2002:a05:600c:474e:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-4954a3d005amr234955265e9.8.1784635857513;
        Tue, 21 Jul 2026 05:10:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed2314sm2598866f8f.23.2026.07.21.05.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:10:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Jul 2026 14:10:55 +0200
Subject: [PATCH v4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM5hX2oC/53RyW6DMBAG4FdBPnciL3iBU9+j6gHsIXEbMLUJK
 op49zqkUlr1kvQ40uj7ZzmThNFjInVxJhFnn3wYclE+FcQemmGP4F2uCadc0ZIbmMLoLaTeKEm
 hWZoBA4zBvuMEiYPzaTw2C7gJpKjaVlfYalqRzI0RO/+5Rb28Xut0at/QThf/uyPixynPMF3bb
 iPUxZ0DpH0vDC3BaFV2OZ/n/HqW5Oc+92OL1tKAoIYh6o4hl/+2ohIlqwA1L5VG7lra1bO5WG2
 TEGzoez/Vxax3jFzOc/BpCnHZHjOz7RqP/2BmwKDrmOCWUke1ej76oYlhF+J+S5n5TZacPyDzL
 FvnyvxelA37K4ubrOkjssgyKofKOCG6qv0lr+v6BYcx5yu0AgAA
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9061;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FMsEnrQ3z5NlomYAxrBGjapuokcLtKDDbhPD0JF8nnU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqX2HQMq/FDT0yjjFaU1rFZ6+cLqgrxaSjJYz3AMzB
 wobgeVqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCal9h0AAKCRB33NvayMhJ0ZHeD/
 wLFPnCYQEyh5rlhGa29tjNcQEXOpaHZL/0MvVXsX/Du1h0DHGbqoInaF1QmEcHOMd6sHzueB3xs9Zt
 kuRIaXVAKIxt6YcDxvNmeY6jmWGODCTLHu/wVgmvn4NcpYPWheKR1+lfzioOgEaAHYH9QX0YmRwzAE
 SjZNtSCjvqkAInVPV2qRZUotijayyl/MruTpvdTWkMIvh8wnxlx03/Xr7CbC6PpAzjRlrvytRgz+Cv
 5FalkkNQuKkIJrIIdw0J8NeLQ7ChSphjOC4Yy+G14SQsDNq3L+FuWDT0zp/YehD/AAbYOH0bYOGE56
 C5XwVWZDA/PAFjDX1hiHx6dNuuEwEWsuICZMCXnqE/frdEYi+beJVQzMfZ1xtoD58pWyuBU3QAoJnb
 nvIEWoyvX+72nkpCSuhOGkodSHRZlp99XVVQ3GXD6GAf/O4Sfgve6J5bCEACjMkqRkqKXkNh8plejP
 C0d0085Mj/48BrZkQ4exrzYXwYjsKAZoJDT6xWFqZS76xupAPqUiJ12Y2YYgddvmIALlnixdZLEOqC
 qKj55p20BBqlFzZxBTRQxW2oZRGM/HnVqVcYMnLKD/vA2fXNAWCfXqffgNvNOuZZDgGNNXT2D65j0u
 A/dq9l9Gr/Ft8LNzTwrvWZp5z1qveZhxoTFrSd6rnZ5s1SLHA/cZ1kGi6OcQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: KancyJoe <kancy2333@outlook.com>

Add nodes for the dual DSI panel, the SGM3804 regulator, the
SY7758 backlight controller, the touch controller, and enable
the GPU to enable full display support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Depends on follwing bindings, all applied into linux-next:
- https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v7-1-16edddda9951@linaro.org/
- https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
- https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
---
Changes in v4:
- Reordered regulator & mdss nodes
- Moved zap shared firmware into separate node
- Link to v3: https://patch.msgid.link/20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org

Changes in v3:
- renamed backlight label and node as "backlight"
- reordered pinctrl properties
- added regulator-boot-on to display regulators
- Link to v2: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org

Changes in v2:
- Update for bindings changes
- Remove empty line
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
---
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 244 +++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..035efeacc7db 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -325,6 +325,23 @@ platform {
 		};
 	};
 
+	sy7758_vdd33_reg: sy7758-vdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "sy7758_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+
+		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&sy7758_vdd33>;
+		pinctrl-names = "default";
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -986,6 +1003,10 @@ gpu7_active: trip-active {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
 &i2c3 {
 	clock-frequency = <100000>;
 
@@ -1016,6 +1037,30 @@ wcd_usbss_sbu_mux: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <162 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_HIGH>;
+		VDDIO-supply = <&vreg_l14b_3p2>;
+		AVDD28-supply = <&vreg_l14b_3p2>;
+
+		touchscreen-size-x = <1440>;
+		touchscreen-size-y = <2560>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_reset_default>, <&ts_irq_default>;
+	};
+};
+
 &i2c6 {
 	clock-frequency = <100000>;
 
@@ -1053,6 +1098,51 @@ redriver_ss_in: endpoint {
 	};
 };
 
+&i2c9 {
+	status = "okay";
+
+	/* Screen power */
+	regulator@3e {
+		compatible = "sgmicro,sgm3804";
+		reg = <0x3e>;
+
+		pinctrl-0 = <&sgm3804_default>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vph_pwr>;
+
+		sgm3804_pos: pos {
+			regulator-name = "panel-avdd-pos";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
+		};
+
+		sgm3804_neg: neg {
+			regulator-name = "panel-avdd-neg";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	/* Backlight */
+	backlight: backlight@2e {
+		compatible = "silergy,sy7758";
+		reg = <0x2e>;
+
+		pinctrl-0 = <&sy7758_default>;
+		pinctrl-names = "default";
+
+		vdd-supply = <&sy7758_vdd33_reg>;
+		enable-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &iris {
 	status = "okay";
 };
@@ -1073,6 +1163,93 @@ &mdss_dp0_out {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	qcom,master-dsi;
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	panel@0 {
+		status = "okay";
+		compatible = "ayaneo,wt0630-2k", "renesas,r63419";
+		reg = <0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vsp-supply = <&sgm3804_pos>;
+		vsn-supply = <&sgm3804_neg>;
+		vci-supply = <&vreg_l13b_3p0>;
+
+		backlight = <&backlight>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		rotation = <90>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				panel0_in_0: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1{
+				reg = <1>;
+				panel0_in_1: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in_0>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel0_in_1>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
@@ -1390,6 +1567,20 @@ sw-ctrl-pins {
 		};
 	};
 
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	fan_pwr_pins: fan-pwr-state {
 		pins = "gpio125";
 		function = "gpio";
@@ -1411,6 +1602,20 @@ fan_int: fan-int-state {
 		bias-pull-up;
 	};
 
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	upd720201_avdd33: upd720201-avdd33-state {
 		pins = "gpio123";
 		function = "gpio";
@@ -1440,6 +1645,13 @@ gamepad_pwr_en: gamepad-pwr-en-active-state {
 		output-high;
 	};
 
+	sgm3804_default: sgm3804-default-state {
+		pins = "gpio58", "gpio59";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
 		pins = "gpio77";
 		function = "gpio";
@@ -1454,6 +1666,34 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		bias-disable;
 	};
 
+	sy7758_default: sy7758-default-state {
+		pins = "gpio164";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sy7758_vdd33: sy7758-vdd33-state {
+		pins = "gpio163";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_irq_default: ts-irq-active-state {
+		pins = "gpio162";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	ts_reset_default: ts-reset-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio107";
 		function = "gpio";
@@ -1549,3 +1789,7 @@ &usb_dp_qmpphy_out {
 &xo_board {
 	clock-frequency = <76800000>;
 };
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8650/ayaneo/ps2/gen70900_zap.mbn";
+};

---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7:v5
prerequisite-patch-id: 901a0948e1afbb03ff78a063d4f66c17665588ef
prerequisite-patch-id: 5ca959a92d05c86ae7a77400d5c4c9bb8bb214f4
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25:v5
prerequisite-patch-id: dd1c5acff71bcfe0730472051c0a5c7c339e2116
prerequisite-patch-id: 30e1bf23756ac7de0e29e4c30e7c9737366cf856
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f:v8
prerequisite-patch-id: 53130195c1df5886a953f3eb1ffea6e5b32257ec
prerequisite-patch-id: 016545217702b15d67b3ac48392c2978fc04b000

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

